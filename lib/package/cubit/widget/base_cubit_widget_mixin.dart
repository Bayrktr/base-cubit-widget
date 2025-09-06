part of 'base_cubit_widget.dart';

mixin _BaseCubitWidgetMixin<T, K, M> on StatelessWidget {
  void _assertions(
      BlocType blocType,
      InitialBuilder<T, K, M>? initialBuilder,
      ErrorBuilder<T, K, M>? errorBuilder,
      LoadingBuilder<T, K, M>? loadingBuilder,
      InitialListener<T, K, M>? initialListener,
      LoadingListener<T, K, M>? loadingListener,
      ErrorListener<T, K, M>? errorListener,
      Widget? child,
      ) {
    assert(
    blocType != BlocType.builder || initialBuilder != null,
    _AssertErrorMessages.successMustBeProvidedForBuilder,
    );
    assert(
    blocType != BlocType.builder || initialListener == null,
    _AssertErrorMessages.unnecessaryUseOfListener,
    );
    assert(
    blocType != BlocType.builder || loadingListener == null,
    _AssertErrorMessages.unnecessaryUseOfListener,
    );
    assert(
    blocType != BlocType.builder || errorListener == null,
    _AssertErrorMessages.unnecessaryUseOfListener,
    );

    // BlocType.listener için
    assert(
    blocType != BlocType.listener || child != null,
    _AssertErrorMessages.childMustBeProvidedForListener,
    );
    assert(
    blocType != BlocType.listener ||
        initialListener != null ||
        loadingListener != null ||
        errorListener != null,
    _AssertErrorMessages.listenerMustBeProvided,
    );
  }
}

@immutable
abstract final class _AssertErrorMessages {
  const _AssertErrorMessages._();

  static const String successMustBeProvidedForBuilder =
      'initialBuilder must be provided when type is BlocType.builder';
  static const String unnecessaryUseOfListener =
      'Unnecessary use of listener when type is BlocType.builder';
  static const String childMustBeProvidedForListener =
      'child must be provided when type is BlocType.listener';
  static const String listenerMustBeProvided =
      'At least one listener (initialListener, loadingListener, errorListener) must be provided when type is BlocType.listener';
}
