import 'package:flutter/material.dart';

import 'test_page/view/test_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TestPageView(),
    );
  }
}
