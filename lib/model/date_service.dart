import 'dart:convert';

import 'package:todo_flutter_spring_app/model/task_service.dart';
import 'package:http/http.dart' as http;

class Date {
  final int id;
  final DateTime startDate;
  //final String utilTime;
  final Task task;

  Date({
    required this.id,
    required this.startDate,
    //required this.utilTime,
    required this.task,
  });

  factory Date.fromMap(Map<String, dynamic> json) {
    return Date(
      id: json['id'] ?? 0,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      //utilTime: json['utilTime'] ?? '',
      task: Task.fromMap(json['task'][0]),
    );
  }
}

class DateServiceAPI {
  // get all dates with task
  Future<List<Date>> getDates() async {
    var response = await http.get(Uri.http('10.0.2.2:8081', 'api/date'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Date> datesList = [];

      for (var eachDate in jsonData) {
        final date = Date.fromMap(eachDate);
        datesList.add(date);
      }

      return datesList;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load tasks');
    }
  }
}

// get dates by start date
Future<List<Date>> getDateByStartDate(DateTime startDate) async {
  var formattedDate = "${startDate.year}-${startDate.month}-${startDate.day}";
  var response = await http.get(Uri.http(
      '10.0.2.2:8081', 'api/date/by-date', {'startDate': formattedDate}));
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Date> startDateList = [];

    for (var eachStartDate in jsonData) {
      final startDate = Date.fromMap(eachStartDate);
      startDateList.add(startDate);
    }
    return startDateList;
  } else {
    throw Exception('Failed to load dates');
  }
}
