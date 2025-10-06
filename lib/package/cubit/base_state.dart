import 'package:equatable/equatable.dart';

import 'package:base_cubit_widget/package/cubit/model/error/base_error_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/initial/base_initial_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/loading/base_loading_data_model.dart';

/// T for initial
/// K for error
/// M for loading

sealed class BaseState<T, K, M> extends Equatable{
  const BaseState();

  factory BaseState.initial({BaseInitialDataModel<T>? data}) {
    return BaseInitialModel<T, K, M>(
      data: data,
    );
  }

  factory BaseState.loading({BaseLoadingDataModel<M>? data}) {
    return BaseLoadingModel<T, K, M>(
      data: data,
    );
  }

  factory BaseState.error({BaseErrorDataModel<K>? data}) {
    return BaseErrorModel<T, K, M>(
      data: data,
    );
  }


  @override
  List<Object?> get props => [this];
}

class BaseInitialModel<T, K, M> extends BaseState<T, K, M> {

  const BaseInitialModel({this.data});
  final BaseInitialDataModel<T>? data;

  T? get model => data?.data;

  @override
  List<Object?> get props => [data];

  BaseInitialModel<T, K, M> copyWith({BaseInitialDataModel<T>? data}) {
    return BaseInitialModel<T, K, M>(
      data: data ?? this.data,
    );
  }
}

class BaseLoadingModel<T, K, M> extends BaseState<T, K, M> {

  BaseLoadingModel({this.data});
  final BaseLoadingDataModel<M>? data;

  @override
  List<Object?> get props => [data];

  BaseLoadingModel<T, K, M> copyWith({
    BaseLoadingDataModel<M>? data,
  }) =>
      BaseLoadingModel<T, K, M>(
        data: data ?? this.data,
      );
}

class BaseErrorModel<T, K, M> extends BaseState<T, K, M> {

  BaseErrorModel({this.data});
  final BaseErrorDataModel<K>? data;

  @override
  List<Object?> get props => [data];

  BaseErrorModel<T, K, M> copyWith({BaseErrorDataModel<K>? data}) =>
      BaseErrorModel<T, K, M>(
        data: data ?? this.data,
      );
}
