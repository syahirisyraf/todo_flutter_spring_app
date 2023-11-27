import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/model/date_service.dart';

// Background colors
var backgroundColor = Colors.white;

// color based on status
Color getStatusColor(String status) {
  switch (status) {
    case 'IN_PROGRESS':
      return Colors.blue;
    case 'COMPLETED':
      return Colors.green;
    case 'TODO':
      return Colors.orange;
    default:
      return Colors.black; // Default color
  }
}

// Text for ListTile
Text trailingText(Date date) {
  return Text(
    date.task.status,
    style: TextStyle(
      fontSize: 16.0,
      color: getStatusColor(date.task.status),
    ),
  );
}

Text subtitleText(Date date) {
  return Text(
    date.task.description,
    style: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
  );
}

Text titleText(Date date) {
  return Text(
    date.task.title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      fontFamily: 'Roboto',
    ),
  );
}
