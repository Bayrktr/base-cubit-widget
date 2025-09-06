sealed class TestResponseStatus {
  const TestResponseStatus();
}

class TestResponseNone extends TestResponseStatus {
  const TestResponseNone();
}

class TestResponseOnProgress extends TestResponseStatus {
  const TestResponseOnProgress();
}

class TestResponseError extends TestResponseStatus {
  TestResponseError();
}

class TestResponseDone extends TestResponseStatus {
  TestResponseDone();
}
