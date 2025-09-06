import 'package:base_cubit_widget/package/cubit/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_cubit_widget_mixin.dart';
part 'state_widget_builder.dart';

typedef InitialBuilder<T, K, M> =
Widget Function(BaseInitialModel<T, K, M> state);

typedef ErrorBuilder<T, K, M> = Widget Function(BaseErrorModel<T, K, M> state);

typedef LoadingBuilder<T, K, M> =
Widget Function(BaseLoadingModel<T, K, M> state);

typedef InitialListener<T, K, M> =
void Function(BuildContext context, BaseInitialModel<T, K, M> state);

typedef LoadingListener<T, K, M> =
void Function(BuildContext context, BaseLoadingModel<T, K, M> state);

typedef ErrorListener<T, K, M> =
void Function(BuildContext context, BaseErrorModel<T, K, M> state);

typedef ListenWhenFunction<T, K, M> =
bool Function(BaseState<T, K, M> previous, BaseState<T, K, M> current);

class BaseCubitWidget<T, K, M> extends StatelessWidget
    with _BaseCubitWidgetMixin<T, K, M> {
  BaseCubitWidget({
    super.key,
    required this.bloc,
    this.blocType = BlocType.builder,
    this.initialListener,
    this.loadingListener,
    this.errorListener,
    this.listenWhen,
    required this.initialBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.child,
  }) {
    _assertions(
      blocType,
      initialBuilder,
      errorBuilder,
      loadingBuilder,
      initialListener,
      loadingListener,
      errorListener,
      child,
    );
  }

  final StateStreamable<BaseState<T, K, M>> bloc;
  final BlocType blocType;

  final InitialListener<T, K, M>? initialListener;
  final LoadingListener<T, K, M>? loadingListener;
  final ErrorListener<T, K, M>? errorListener;
  final ListenWhenFunction<T, K, M>? listenWhen;

  final InitialBuilder<T, K, M> initialBuilder;
  final ErrorBuilder<T, K, M>? errorBuilder;
  final LoadingBuilder<T, K, M>? loadingBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    switch (blocType) {
      case BlocType.builder:
        return BlocBuilder<
            StateStreamable<BaseState<T, K, M>>,
            BaseState<T, K, M>
        >(builder: _buildBlocBuilder, bloc: bloc);

      case BlocType.listener:
        return BlocListener<
            StateStreamable<BaseState<T, K, M>>,
            BaseState<T, K, M>
        >(
          bloc: bloc,
          listenWhen: listenWhen,
          listener: (context, state) {
            if (state is BaseInitialModel<T, K, M>) {
              initialListener?.call(context, state);
            } else if (state is BaseLoadingModel<T, K, M>) {
              loadingListener?.call(context, state);
            } else if (state is BaseErrorModel<T, K, M>) {
              errorListener?.call(context, state);
            }
          },
          child: child ?? _buildBlocBuilder(context, bloc.state),
        );

      case BlocType.both:
        return BlocConsumer<
            StateStreamable<BaseState<T, K, M>>,
            BaseState<T, K, M>
        >(
          bloc: bloc,
          listenWhen: listenWhen,
          listener: (context, state) {
            if (state is BaseInitialModel<T, K, M>) {
              initialListener?.call(context, state);
            } else if (state is BaseLoadingModel<T, K, M>) {
              loadingListener?.call(context, state);
            } else if (state is BaseErrorModel<T, K, M>) {
              errorListener?.call(context, state);
            }
          },
          builder: _buildBlocBuilder,
        );
    }
  }

  Widget _buildBlocBuilder(BuildContext context, BaseState<T, K, M> state) {
    return _StateWidgetBuilder(
      state: state,
      initial: initialBuilder,
      error: errorBuilder,
      loading: loadingBuilder,
      child: child,
    );
  }
}

enum BlocType { builder, listener, both }
