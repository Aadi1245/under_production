import 'package:flutter/material.dart';

class WorkoutForTuesday extends StatefulWidget {
  const WorkoutForTuesday({super.key});

  @override
  State<WorkoutForTuesday> createState() => _WorkoutForTuesdayState();
}

class _WorkoutForTuesdayState extends State<WorkoutForTuesday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text("Tuesday Workout"),
      ),
    );
  }
}
