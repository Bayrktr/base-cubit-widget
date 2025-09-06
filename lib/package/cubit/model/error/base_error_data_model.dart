import 'package:equatable/equatable.dart';

class BaseErrorDataModel<T> with EquatableMixin {
  BaseErrorDataModel({this.statusCode, this.message, this.data});

  final int? statusCode;
  final String? message;
  final T? data;

  @override
  List<Object?> get props => [statusCode, message, data];

  BaseErrorDataModel<T> copyWith({int? statusCode, String? message, T? data}) =>
      BaseErrorDataModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}
