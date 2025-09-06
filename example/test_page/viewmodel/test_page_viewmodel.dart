import 'package:base_cubit_widget/package/cubit/base_cubit.dart';
import 'package:base_cubit_widget/package/cubit/base_state.dart';
import 'package:base_cubit_widget/package/cubit/model/initial/base_initial_data_model.dart';

import '../model/test_page_initial.dart';
import '../model/test_response/test_response_status.dart';

class TestPageViewmodel extends BaseCubit<TestPageInitial, Object, Object> {
  TestPageViewmodel()
    : super(
        BaseState.initial(
          data: BaseInitialDataModel(data: TestPageInitial()),
        ),
      );

  @override
  Future<void> onInit() async {
    await updateTestResponseStatus();
  }

  Future<void> updateTestResponseStatus() async {
    await Future.delayed(Duration(seconds: 2));
    emitInitial(
      initialModel!.copyWith(
        testStatus: TestResponseDone(),
      ),
    );
  }
}
