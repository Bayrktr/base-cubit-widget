import 'package:base_cubit_widget/package/cubit/widget/base_cubit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/test_response/test_response_status.dart';
import '../viewmodel/test_page_viewmodel.dart';

class TestPageView extends StatelessWidget {
  const TestPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = TestPageViewmodel();
    return BlocProvider(
      create: (_) => viewModel,
      child: BaseCubitWidget(
        bloc: viewModel,
        blocType: BlocType.both,
        initialBuilder: (state) {
          return const Scaffold(
            body: Text('Initial Durum'),
          );
        },
        initialListener: (_,state){
          if(state.model?.testStatus is TestResponseDone){
          // burda bildirim gosterilebilir
          }
        },
      ),
    );
  }
}
