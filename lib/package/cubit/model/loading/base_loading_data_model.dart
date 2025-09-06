import 'package:equatable/equatable.dart';

class BaseLoadingDataModel<T> with EquatableMixin {
  BaseLoadingDataModel({this.loadingPercentage = 0, this.message, this.data});

  final double? loadingPercentage;
  final String? message;
  final T? data;

  @override
  List<Object?> get props => [loadingPercentage, message, data];

  BaseLoadingDataModel<T> copyWith({
    double? loadingPercentage,
    String? message,
    T? data,
  }) => BaseLoadingDataModel<T>(
    loadingPercentage: loadingPercentage ?? this.loadingPercentage,
    message: message ?? this.message,
    data: data ?? this.data,
  );
}
