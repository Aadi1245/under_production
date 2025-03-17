import 'package:flutter/material.dart';

class WorkoutForMonday extends StatefulWidget {
  const WorkoutForMonday({super.key});

  @override
  State<WorkoutForMonday> createState() => _WorkoutForMondayState();
}

class _WorkoutForMondayState extends State<WorkoutForMonday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Monday Workout"),
      ),
    );
  }
}
