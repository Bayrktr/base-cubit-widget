# Base Cubit Widget

It is a package derived from the Cubit package, aiming to reduce code duplication.

## 📱 Project Structure

```
├── example
│   ├── main.dart
│   └── test_page
│       ├── model
│       ├── view
│       └── viewmodel
├── lib
│   ├── export.dart
│   └── package
│       └── cubit  
```

## 🚀 Features
- There are three basic situations on a standard mobile application page. When we use Initial, Loading, Error, bloc or cubit directly, we have to develop these situations over and over again. Thanks to this package, we can easily provide state management through 3 states.

**STATE**

```dart
abstract class BaseCubit<T, K, M> extends Cubit<BaseState<T, K, M>> {
  BaseCubit(super.state) {
    onInit();
  }

  @protected
  Future<void> onInit();

  void emitInitial(T data) {
    final model = (initialData == null)
        ? BaseInitialDataModel(data: data)
        : initialData!.copyWith(
            data: data,
          );
    emit(
      BaseState.initial(
        data: model,
      ),
    );
  }

  void emitLoading({
    double? percentage,
    String? message,
    M? data,
  }) {
    final model = (loadingData == null)
        ? BaseLoadingDataModel(
            loadingPercentage: percentage,
            message: message,
            data: data,
          )
        : loadingData!.copyWith(
            loadingPercentage: percentage,
            message: message,
            data: data,
          );
    emit(
      BaseState.loading(
        data: model,
      ),
    );
  }

  void emitError({
    int? statusCode,
    String? message,
    K? data,
  }) {
    final model = (errorData == null)
        ? BaseErrorDataModel(
            statusCode: statusCode,
            message: message,
            data: data,
          )
        : errorData!.copyWith(
            statusCode: statusCode,
            message: message,
            data: data,
          );
    emit(
      BaseState.error(
        data: model,
      ),
    );
  }

  bool get isInitial => state is BaseInitialModel;

  bool get isLoading => state is BaseLoadingModel;

  bool get isError => state is BaseErrorModel;

  BaseInitialModel<T, K, M>? get initialState =>
      state is BaseInitialModel<T, K, M>
      ? state as BaseInitialModel<T, K, M>
      : null;

  BaseLoadingModel<T, K, M>? get loadingState =>
      state is BaseLoadingModel<T, K, M>
      ? state as BaseLoadingModel<T, K, M>
      : null;

  BaseErrorModel<T, K, M>? get errorState => state is BaseErrorModel<T, K, M>
      ? state as BaseErrorModel<T, K, M>
      : null;

  BaseInitialDataModel<T>? get initialData => initialState?.data;

  BaseLoadingDataModel<M>? get loadingData => loadingState?.data;

  BaseErrorDataModel<K>? get errorData => errorState?.data;

  T? get initialModel => initialData?.data;

  M? get loadingModel => loadingData?.data;

  K? get errorModel => errorData?.data;

  @override
  void emit(BaseState<T, K, M> state) {
    if (!isClosed) super.emit(state);
  }
}

```


**BUILDER**


```dart

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

```

