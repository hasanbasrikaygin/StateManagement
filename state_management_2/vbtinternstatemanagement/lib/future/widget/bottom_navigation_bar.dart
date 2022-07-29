import 'package:flutter/material.dart';
import 'package:vbtinternstatemanagement/future/todo/todo_view.dart';
import 'package:vbtinternstatemanagement/future/postView.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();
}

class _MainBottomClassState extends State<MainBottomClass> {
  int selectedIndex = 0;

  final widgetOptions = [
    new PostPage(),
    new TodoView(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Post", "To do"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6c3497),
        title: Text(widgetTitle.elementAt(selectedIndex)),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF4b0082),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.home,
              color: Colors.white,
            ),
            label: "Post Model",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.search_rounded,
                color: Colors.white,
              ),
              label: "Todo"),
        ],
        currentIndex: selectedIndex,
        iconSize: 30,
        fixedColor: Colors.white,
        onTap: onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 20),
        unselectedFontSize: 16,
        selectedIconTheme: const IconThemeData(
          color: Colors.blue,
          opacity: 3.0,
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 0.3,
        ),
      ),
    );
  }
}
