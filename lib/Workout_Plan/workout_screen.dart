import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1.8,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/workout.jpg'),
                fit: BoxFit.cover)),
      ),
      Positioned(
          top: 602,
          left: 280,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(5),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("Go Back")),
            ),
          ))
    ]);
  }
}
