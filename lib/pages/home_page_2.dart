import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/model/task_service.dart';
import 'package:http/http.dart' as http;

class HomePageTest2 extends StatelessWidget {
  HomePageTest2({super.key});

  List<Task> tasks = [];

  // from youtube
  Future getTask() async {
    var response = await http.get(Uri.http('10.0.2.2:8081', 'api/task'));
    var jsonData = jsonDecode(response.body);

    for (var eachTask in jsonData) {
      final task = Task(
        id: eachTask['id'],
        title: eachTask['title'],
        description: eachTask['description'],
        status: eachTask['status'],
      );
      tasks.add(task);
    }
    print(tasks.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getTask(),
        builder: (context, snapshot) {
          // if it done loading? Show task data
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(tasks[index].id.toString()),
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].status),
                );
              },
            );
          } else {
            // show loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
