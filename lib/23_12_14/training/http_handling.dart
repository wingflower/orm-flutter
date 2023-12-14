import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'todo.dart';

void main() async {
  // 실습 1
  final Todo todo = await getTodo2(1);
  print(todo.title);

  // 실습 2
  List<Todo> todos = await getTodos();
  todos.forEach((e) {
    print('${e.toJson()}');
  });
}

// 여러개 리스트 받을 때 패턴
Future<List<Todo>> getTodos2() async {
  // 요청
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  final jsonList = jsonDecode(response.body) as List<dynamic>;
  return jsonList.map((e) => Todo.fromJson(e)).toList();
}

// 하나 받을 때 패턴
Future<Todo> getTodo2(int id) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
  return Todo.fromJson(jsonDecode(response.body));
}

// 여러개 리스트 받을 때 패턴
Future<List<Todo>> getTodos() async {
  // 요청
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  // jsonString
  final jsonString = response.body;
  // to Map
  final jsonList = jsonDecode(jsonString) as List<dynamic>;
  return jsonList.map((e) => Todo.fromJson(e)).toList();
}

Future<Todo> getTodo(int id) async {
  // 요청
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
  // jsonString
  final jsonString = response.body;
  // to Map
  final json = jsonDecode(jsonString);
  // 모델클래스로 변환
  // return Todo.fromJson(json);
  return Todo.fromJson(jsonDecode(response.body));
}