import 'package:base_cubit_widget/package/cubit/base_cubit.dart';
import 'package:base_cubit_widget/package/cubit/base_state.dart';
import 'package:base_cubit_widget/package/cubit/model/initial/base_initial_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock classes
class TestCubit extends BaseCubit<String, String, String> {
  TestCubit() : super(BaseState.initial(data: BaseInitialDataModel(data: 'initial')));

  @override
  Future<void> onInit() async {}
}

void main() {
  group('BaseCubit', () {
    late TestCubit testCubit;

    setUp(() {
      testCubit = TestCubit();
    });

    test('initial state is correct', () {
      expect(testCubit.state, isA<BaseInitialModel>());
      expect(testCubit.initialModel, 'initial');
    });

    test('emitInitial updates the state correctly', () {
      testCubit.emitInitial('new initial');
      expect(testCubit.state, isA<BaseInitialModel>());
      expect(testCubit.initialModel, 'new initial');
    });

    test('emitLoading updates the state correctly', () {
      testCubit.emitLoading(percentage: 50, message: 'loading', data: 'loading data');
      expect(testCubit.state, isA<BaseLoadingModel>());
      expect(testCubit.loadingData?.loadingPercentage, 50);
      expect(testCubit.loadingData?.message, 'loading');
      expect(testCubit.loadingModel, 'loading data');
    });

    test('emitError updates the state correctly', () {
      testCubit.emitError(statusCode: 404, message: 'error', data: 'error data');
      expect(testCubit.state, isA<BaseErrorModel>());
      expect(testCubit.errorData?.statusCode, 404);
      expect(testCubit.errorData?.message, 'error');
      expect(testCubit.errorModel, 'error data');
    });

    test('isInitial returns true for initial state', () {
      testCubit.emitInitial('initial');
      expect(testCubit.isInitial, isTrue);
      expect(testCubit.isLoading, isFalse);
      expect(testCubit.isError, isFalse);
    });

    test('isLoading returns true for loading state', () {
      testCubit.emitLoading();
      expect(testCubit.isInitial, isFalse);
      expect(testCubit.isLoading, isTrue);
      expect(testCubit.isError, isFalse);
    });

    test('isError returns true for error state', () {
      testCubit.emitError();
      expect(testCubit.isInitial, isFalse);
      expect(testCubit.isLoading, isFalse);
      expect(testCubit.isError, isTrue);
    });
  });
}