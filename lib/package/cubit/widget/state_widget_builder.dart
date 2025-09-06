part of 'base_cubit_widget.dart';

final class _StateWidgetBuilder<T, K, M> extends StatelessWidget {
  const _StateWidgetBuilder({
    required this.state,
    required this.initial,
    this.error,
    this.loading,
    this.child,
  });

  final BaseState<T, K, M> state;
  final InitialBuilder<T, K, M> initial;
  final ErrorBuilder<T, K, M>? error;
  final LoadingBuilder<T, K, M>? loading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (state is BaseInitialModel<T, K, M>) {
      final initialState = state as BaseInitialModel<T, K, M>;
      return initial(initialState);
    } else if (state is BaseLoadingModel<T, K, M>) {
      final loadingState = state as BaseLoadingModel<T, K, M>;
      return loading?.call(loadingState) ??
          const Center(child: CircularProgressIndicator());
    } else if (state is BaseErrorModel<T, K, M>) {
      final errorState = state as BaseErrorModel<T, K, M>;
      return error?.call(errorState) ??
          Center(
            child: Text(
              errorState.data?.message ?? 'ERROR',
              textAlign: TextAlign.center,
            ),
          );
    }

    return child ?? const SizedBox.shrink();
  }
}
