import 'package:flutter/material.dart';
import 'future/postView.dart';
import 'future/widget/bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainBottomClass(),
    );
  }
}
