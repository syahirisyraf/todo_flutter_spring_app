import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/model/date_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Header Container
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (newDate) {
                setState(
                  () {
                    selectedDate = newDate;
                  },
                );
              },
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                selectedDateFormat: SelectedDateFormat.fullDateDMY,
              ),
              dayProps: const EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3371FF),
                        Color(0xff8426D6),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // body container
            Expanded(
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
                      children: snapshot.data!.map((date) {
                        return ListTile(
                          //leading: Text(date.startDate),
                          title: Text(date.task.title),
                          subtitle: Text(date.task.description),
                          trailing: Text(date.task.status),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  body: FutureBuilder(
        future: getDates(),
        builder: (context, AsyncSnapshot<List<Date>> snapshot) {
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
                leading: Text(snapshot.data![index].startDate),
                title: Text(snapshot.data![index].task.title),
                subtitle: Text(snapshot.data![index].task.description),
                trailing: Text(snapshot.data![index].task.status),
              );
            },
          );
        },
      ),
 */



// return Scaffold(
//       body: FutureBuilder(
//         future: getTasks(),
//         builder: (context, AsyncSnapshot<List<Task>> snapshot) {
//           // Check for errors
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           // Show a loading indicator while the tasks are loading
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // Display the tasks if available
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: Text(snapshot.data![index].title),
//                 title: Text(snapshot.data![index].description),
//                 subtitle: Text(snapshot.data![index].status),
//               );
//             },
//           );
//         },
//       ),
//     );

/* 
  FutureBuilder(
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
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //leading: Text(snapshot.data![index].startDate),
                    title: Text(snapshot.data![index].task.title),
                    subtitle: Text(snapshot.data![index].task.description),
                    trailing: Text(snapshot.data![index].task.status),
                  );
                },
              );
            },
          ),
 */