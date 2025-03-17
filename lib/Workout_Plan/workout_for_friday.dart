import 'package:flutter/material.dart';

class WorkoutForFriday extends StatefulWidget {
  const WorkoutForFriday({super.key});

  @override
  State<WorkoutForFriday> createState() => _WorkoutForFridayState();
}

class _WorkoutForFridayState extends State<WorkoutForFriday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text("Friday Workout"),
      ),
    );
  }
}
