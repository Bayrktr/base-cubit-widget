import 'package:equatable/equatable.dart';

import 'test_response/test_response_status.dart';

class TestPageInitial with EquatableMixin {
  const TestPageInitial({this.testStatus = const TestResponseNone()});

  final TestResponseStatus testStatus;

  @override
  List<Object?> get props => [testStatus];

  TestPageInitial copyWith({
    TestResponseStatus? testStatus,
  }) => TestPageInitial(
    testStatus: testStatus ?? this.testStatus,
  );
}
