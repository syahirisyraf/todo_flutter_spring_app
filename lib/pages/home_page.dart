import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/model/task_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getTasks(),
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Show a loading indicator while the tasks are loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Display the tasks if available
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(snapshot.data![index].id.toString()),
                title: Text(snapshot.data![index].title),
                subtitle: Text(snapshot.data![index].status),
              );
            },
          );
        },
      ),
    );
  }
}
