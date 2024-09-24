import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Calendar View'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Add code to handle button click
              print('Button clicked!');
            },
            child: Text('Click Me'),
          ),
        ],
      ),
    );
  }
}
