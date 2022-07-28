import 'package:flutter/material.dart';
import 'package:state_management/feature/home_page/view/homepage_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',home: HomePage(),
    ); 
    
  }
}