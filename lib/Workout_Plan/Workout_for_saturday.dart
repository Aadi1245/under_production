import 'package:flutter/material.dart';

class WorkoutForSaturday extends StatefulWidget {
  const WorkoutForSaturday({super.key});

  @override
  State<WorkoutForSaturday> createState() => _WorkoutForSaturdayState();
}

class _WorkoutForSaturdayState extends State<WorkoutForSaturday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text("Sturday Workout"),
      ),
    );
    ;
  }
}
