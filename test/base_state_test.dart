import 'package:base_cubit_widget/package/cubit/base_state.dart';
import 'package:base_cubit_widget/package/cubit/model/error/base_error_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/initial/base_initial_data_model.dart';
import 'package:base_cubit_widget/package/cubit/model/loading/base_loading_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseState', () {
    test('BaseState.initial creates a BaseInitialModel', () {
      final initialState = BaseState.initial(data: BaseInitialDataModel(data: 'initial'));
      expect(initialState, isA<BaseInitialModel>());
      expect((initialState as BaseInitialModel).data?.data, 'initial');
    });

    test('BaseState.loading creates a BaseLoadingModel', () {
      final loadingState = BaseState.loading(data: BaseLoadingDataModel(data: 'loading'));
      expect(loadingState, isA<BaseLoadingModel>());
      expect((loadingState as BaseLoadingModel).data?.data, 'loading');
    });

    test('BaseState.error creates a BaseErrorModel', () {
      final errorState = BaseState.error(data: BaseErrorDataModel(data: 'error'));
      expect(errorState, isA<BaseErrorModel>());
      expect((errorState as BaseErrorModel).data?.data, 'error');
    });
  });

  group('BaseInitialModel', () {
    test('copyWith creates a new instance with updated data', () {
      final initialModel = BaseInitialModel(data: BaseInitialDataModel(data: 'initial'));
      final updatedModel = initialModel.copyWith(data: BaseInitialDataModel(data: 'updated'));
      expect(updatedModel.data?.data, 'updated');
    });
  });

  group('BaseLoadingModel', () {
    test('copyWith creates a new instance with updated data', () {
      final loadingModel = BaseLoadingModel(data: BaseLoadingDataModel(data: 'loading'));
      final updatedModel = loadingModel.copyWith(data: BaseLoadingDataModel(data: 'updated'));
      expect(updatedModel.data?.data, 'updated');
    });
  });

  group('BaseErrorModel', () {
    test('copyWith creates a new instance with updated data', () {
      final errorModel = BaseErrorModel(data: BaseErrorDataModel(data: 'error'));
      final updatedModel = errorModel.copyWith(data: BaseErrorDataModel(data: 'updated'));
      expect(updatedModel.data?.data, 'updated');
    });
  });

  group('DataModels', () {
    test('BaseInitialDataModel holds data correctly', () {
      final dataModel = BaseInitialDataModel(data: 'initial data');
      expect(dataModel.data, 'initial data');
    });

    test('BaseLoadingDataModel holds data correctly', () {
      final dataModel = BaseLoadingDataModel(data: 'loading data', message: 'loading message', loadingPercentage: 50.0);
      expect(dataModel.data, 'loading data');
      expect(dataModel.message, 'loading message');
      expect(dataModel.loadingPercentage, 50.0);
    });

    test('BaseErrorDataModel holds data correctly', () {
      final dataModel = BaseErrorDataModel(data: 'error data', message: 'error message', statusCode: 404);
      expect(dataModel.data, 'error data');
      expect(dataModel.message, 'error message');
      expect(dataModel.statusCode, 404);
    });
  });
}