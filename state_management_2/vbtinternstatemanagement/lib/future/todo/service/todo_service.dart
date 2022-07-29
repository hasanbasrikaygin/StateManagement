import 'package:http/http.dart' as http;
import 'package:vbtinternstatemanagement/future/todo/model/todo_model.dart';

class ToDoService {
  Future<ToDoModel?> getToDo(String? id) async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"));
    if (response.statusCode == 200) {
      return toDoModelFromJson(response.body);
    } else {
      throw Exception("Data bulunamadı");
    }
  }
}
