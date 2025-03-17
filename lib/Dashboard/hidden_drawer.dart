import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myfitnessapp/Dashboard/HomeScreen.dart';
import 'package:myfitnessapp/Workout_Plan/Workout_for_saturday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_friday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_thursday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_tuesday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_monday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_wednesday.dart';
import 'package:myfitnessapp/welcom_screen.dart';

import '../Workout_Plan/workout_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Workout Plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          WorkoutScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Monday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForMonday()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Tuesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForTuesday()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Wednesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForWednesday()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Thursday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForThursday()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Friday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForFriday()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Saturday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          WorkoutForSaturday()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages, backgroundColorMenu: Colors.blueGrey);
  }
}
