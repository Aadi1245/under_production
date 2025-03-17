import 'package:flutter/material.dart';

class WorkoutForWednesday extends StatefulWidget {
  const WorkoutForWednesday({super.key});

  @override
  State<WorkoutForWednesday> createState() => _WorkoutForWednesdayState();
}

class _WorkoutForWednesdayState extends State<WorkoutForWednesday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text("Wednesday Workout"),
      ),
    );
    ;
  }
}
