import 'package:flutter/material.dart';
import 'package:vbtinternstatemanagement/future/todo/model/todo_model.dart';
import 'package:vbtinternstatemanagement/future/todo/service/todo_service.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  ToDoService todo = ToDoService();
  ToDoModel? toDoModel;
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    toDoModel = await todo.getToDo("1");
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Card(
                child: Text(toDoModel?.title ?? "Boş"),
              ),
            )
          : const Center(child: LinearProgressIndicator()),
    );
  }
}
