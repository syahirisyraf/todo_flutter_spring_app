import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_flutter_spring_app/global/const.dart';
import 'package:todo_flutter_spring_app/model/date_service.dart';

class ListViewBodyContainer extends StatelessWidget {
  const ListViewBodyContainer({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: FutureBuilder(
          future: getDateByStartDate(selectedDate),
          builder: (context, AsyncSnapshot<List<Date>> snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            // Show a loading indicator while the dates are loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Display the dates if available
            return Column(
              children: snapshot.data!.map(
                (date) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: null,
                          icon: Icons.delete,
                          backgroundColor: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        //leading: Text(date.startDate),
                        title: titleText(date),
                        subtitle: subtitleText(date),
                        trailing: trailingText(date),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
