import 'package:flutter/material.dart';
import '../../../globels.dart' as globals;

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
                image: AssetImage(globals.gender == "female"
                    ? "assets/images/womenWorkoutImage.jpg"
                    : 'assets/images/workout.jpg'),
                fit: BoxFit.cover)),
      ),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.78, //680
          left: MediaQuery.of(context).size.width * 0.74, //280,
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
          )),
      globals.gender == "female"
          ? Positioned(
              top: MediaQuery.of(context).size.height * 0.5, //680
              left: MediaQuery.of(context).size.width * 0.01, //280,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(5),

                  // decoration: BoxDecoration(
                  //     color: Colors.white70,
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "IT NEVER GET \n EASIER,\nYOU JUST GET \n STRONGER",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  )),
                ),
              ))
          : Container()
    ]);
  }
}
