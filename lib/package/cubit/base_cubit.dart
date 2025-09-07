import 'package:base_cubit_widget/package/cubit/base_state.dart';
import 'package:base_cubit_widget/package/cubit/model/error/base_error_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/initial/base_initial_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/loading/base_loading_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

abstract class BaseCubit<T, K, M> extends Cubit<BaseState<T, K, M>> {
  BaseCubit(super.state) {
    onInit();
  }

  @protected
  Future<void> onInit();

  void emitInitial(T data) {
    emit(BaseState.initial(data: BaseInitialDataModel(data: data)));
  }

  void emitLoading({
    double? percentage,
    String? message,
    M? data,
  }) {
    emit(
      BaseState.loading(
        data: BaseLoadingDataModel(
          loadingPercentage: percentage,
          message: message,
          data: data,
        ),
      ),
    );
  }

  void emitError({
    int? statusCode,
    String? message,
    K? data,
  }) {
    emit(
      BaseState.error(
        data: BaseErrorDataModel(
          statusCode: statusCode,
          message: message,
          data: data,
        ),
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
