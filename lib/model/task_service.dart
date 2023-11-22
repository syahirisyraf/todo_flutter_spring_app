import 'dart:convert';
import 'package:http/http.dart' as http;

class Task {
  final int id;
  final String title;
  final String description;
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

// Future get task
const String baseURL = 'http://10.0.2.2:8081/api/task';
const Map<String, String> headers = {'Content-Type': 'application/json'};

// from chatGPT
Future<List<Task>> getTasks() async {
  var response = await http.get(Uri.http('10.0.2.2:8081', 'api/task'));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Task> tasksList = [];

    for (var eachTask in jsonData) {
      final task = Task.fromMap(eachTask);
      tasksList.add(task);
    }

    return tasksList;
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load tasks');
  }
}
