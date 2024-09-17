import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  Future<List<Todo>> gettodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element) {
      todos.add(Todo.fromjson(element));
    });
    return todos;
  }
}
