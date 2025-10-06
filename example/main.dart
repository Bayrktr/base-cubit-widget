import 'package:flutter/material.dart';

import 'test_page/view/test_page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: TestPageView(),
    );
  }
}
