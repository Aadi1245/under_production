import 'package:flutter/material.dart';

class WorkoutForThursday extends StatefulWidget {
  const WorkoutForThursday({super.key});

  @override
  State<WorkoutForThursday> createState() => _WorkoutForThursdayState();
}

class _WorkoutForThursdayState extends State<WorkoutForThursday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text("Thursday Workout"),
      ),
    );
    ;
  }
}
