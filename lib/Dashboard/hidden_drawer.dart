import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myfitnessapp/Dashboard/HomeScreen.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import 'package:myfitnessapp/Workout_Plan/Workout_for_saturday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_friday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_thursday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_tuesday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_monday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_wednesday.dart';
import 'package:myfitnessapp/app_assets.dart';
import 'package:myfitnessapp/welcom_screen.dart';
import '../../../globels.dart' as globals;
import '../Workout_Plan/womens_workout.dart';
import '../Workout_Plan/workout_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<String> wMonday = [
    "Chest",
    "Shoulders",
    "Triceps",
    "Abs",
  ];
  List<List<String>> subExerciseMonday = [
    ["Bench Press", "Dumbbell press", "Dumbbell Flyes"],
    ["Lateral Raises"],
    ["tricep Dips", "Rope Pushdowns"],
    ["Hanginig Leg Raises", "Cable Crunches"]
  ];
  List<List<String>> subImgMonday = [
    [
      "https://www.bodybuilding.com/images/2018/august/a-girls-gotta-bench-chest-workout-and-training-tips-header-960x540.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4TC_kHXZ8BtqjtP7z-H4gEBhvpP3HZs-Y0g&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkeMHqEN_RWm4OLCGmlEDwu5Eco5I_eMxQDw&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxh70EXI__yf4FBhI_dkOqoQP2kmHmXKrKqw&s"
    ],
    [
      "https://thumbs.dreamstime.com/b/bench-triceps-dips-female-exercise-guide-black-white-illustration-concept-girl-home-fitness-workout-woman-working-her-200112710.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4O5Mjfog-DIi_sS0Jy8rsiRio39IpqX9M1g&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5dq7KQ8oIwBr1JWJwcBcuUQLEAYUyYEN7VQ&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo4ESDccCOfolmcYxNNf2WAcNcp6KwMXRxhQ&s"
    ]
  ];

  List<String> wTuesday = ["Back", "Rear Delts", "Traps", "Biceps", "Abs"];
  List<List<String>> subExerciseTuesday = [
    ["Pull-Ups", "Barbell Row", "Seated Cable Row"],
    ["Face Pulls"],
    ["Dumbbell Shrugs"],
    ["Barbell Curls", "Hammer Curls"],
    ["Plank Hold", "Rassian Twist"]
  ];
  List<List<String>> subImgTuesday = [
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpTWGzCn07GgF11GAAPnQ5YecyQqgZQzIieg&s",
      "https://media.istockphoto.com/id/499781692/photo/barbell-rows.jpg?s=612x612&w=0&k=20&c=4mnrk_k02fmDUT0KS2ECNi_rG1K0_5IvokGzotbtgns=",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpRwyOw8U4Sk7KWR4XuOtJZ7bbJOKiyaumnA&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAwSwKrLaXNvpgTrNxAkRDv9kafRAcoKnvgg&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1nVq5G17JqlykXfdKS9lxpJcn2K3QEEaM-Q&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkmr5oS5wdw-P8JLf8ydXySNre9ArlLnD3Lg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-o0uP3jchsoWZId6oPpz9h4k-_wSpUZqj_A&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNVGwXG8J6873PHiPwqK3NJCL392iTeopyPQ&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYAoLHWhI8cNdR2g52qyqo5X3lB4fLPbdcrA&s"
    ]
  ];
  List<String> wWednesday = [
    "Quads",
    "Hamstrings",
    "Calves",
    "Abs",
  ];
  List<List<String>> subExerciseWednesday = [
    ["Back Squats", "Leg Press", "Bulgarian Split Squats"],
    ["Roman Deadlifts", "Lying Leg Curls"],
    ["Seated Calf Raises"],
    ["Decline Sit-Ups", "Side Plank"]
  ];
  List<List<String>> subImgWednesday = [
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0MJT3zZKF8EnRWsEUQRCXDGNAkGsZO8qjCA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU-CXR_GeTBdMYWTVfLDqDxlI9cvuFuhXl0w&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvKLTHKN85UmiMihdjRxAYPQ9sDat-Ll5H3Q&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROO965KBGE4-7y8ZAJ_G_PQMpoMXSeleorDA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEKzx8LE6rFxZf78XKFifUgmSiy-ZDSzYD7g&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2bxPfc-9Rxq0rpbpR6HuPg8_8mfcr5Wm-kQ&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLMg5Zmsl_M1rfjTDTT4b3u6XuhfptV1sARA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlV_1ga3VLy1iZ3jVMMQMwnaOVMKIGJICDAA&s"
    ]
  ];
  List<String> wThursday = [
    "Back",
    "Chest",
    "Shoulders",
    "Byceps",
    "Triceps",
  ];
  List<List<String>> subExerciseThursday = [
    ["Dead Lift", "Pull-Ups"],
    ["Incline Dumbbell Press", "Cable Crossovers"],
    ["Arnold Press"],
    ["Concentration Curls"],
    ["Close-Grip Bench Press"]
  ];
  List<List<String>> subImgThursday = [
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGivDT3zyJCfO3cYkwRkx51BfkR_U4SQ0BLQ&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpTWGzCn07GgF11GAAPnQ5YecyQqgZQzIieg&s",
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw1Gk0lqMImvEZa6Vl2BErZ0aKhTSMRdm4Ug&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL1zubGzJ_inTM5MfWNs6mG5pqYRYWaKqjpw&s"
    ],
    [
      "https://dannyleejames.com/wp-content/uploads/2024/02/Arnold-Press-Form-1024x576.jpg"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML6NziLdLsPbrObRJUtGLv5FZEeGCvvl2Ew&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsbA_JeUGEWW_0SXUE0oM1v7DIyd4i7QnRsQ&s"
    ]
  ];

  List<String> wFriday = [
    "Hamstring",
    "Quads",
    "Calves",
    "Abs",
  ];
  List<List<String>> subExerciseFriday = [
    ["Romanian Deadlifts", "Nordic Curls", "Stiff-Leg Deadlifts"],
    ["Front Squats", "Step Ups"],
    ["Standing Calf Raises", "Donkey Calf Raises"],
    ["Hanging Leg Raises", "Cable Woodchoppers"]
  ];
  List<List<String>> subImgFriday = [
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROO965KBGE4-7y8ZAJ_G_PQMpoMXSeleorDA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdzyuGJSHCkeCWVVpA9yFk3pADhnSUSdaJlg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGivDT3zyJCfO3cYkwRkx51BfkR_U4SQ0BLQ&s",
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVKIaIGmN5e5XfUGWmytB2syP6PBJNkyqhlw&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlNH6mMCiFqVsCbW9yvDKXCg-dEhAKM4rDXA&s"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjNcBDa3x7po8nMEQw-SiMQ7QvKSJrCKP2TA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1NvDuFke9yNkm8C4-FNjkgmamzBA11RHSFw&s",
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5dq7KQ8oIwBr1JWJwcBcuUQLEAYUyYEN7VQ&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL1zubGzJ_inTM5MfWNs6mG5pqYRYWaKqjpw&s"
    ],
  ];

  List<String> exerciseForSaturday = [
    "Forward Lunge",
    "Bodyweight Squat",
    "Mountain Climber",
    "Running",
    "Burpees",
    "High Kick",
    "Hand Chest Press and Row",
    "Sit-Ups",
    "Bicycle"
  ];
  List<String> imgForSaturday = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRABh8XwJrG8A_QHt-q3hg4ZxDQPTe6-jm62g&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6cz2WwZZtI9hTzrDopguMjb3EhkXEOm12hA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZGW8Vqp4eWAEJ-4JZEr8NB87pkWQMA0pxhw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8aY5Jh-VLa4YeaAdh6gaFO8c7fKHyQm9bNQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPBdYWNeibnkqJxJ4bQPdnVlcgDmytyQXa3w&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6GqrBk54oQl6bC3c9yUAkCNjuE7KQq-t4qQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrP94jyKwLr1jmfddrH1mu-B7D6hbvn1GyKw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ42f7TF_-pvHTEXcvLhXEGV1v0Ht8NZnQRxA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUlHQ0ACi5CKLuSmvjCnxFkTutvZv-k6hz3A&s"
  ];
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
          globals.gender == "male"
              ? WorkoutForMonday()
              : Womensworkout(
                  appBarTitle: "Push Workout",
                  exerciseName: wMonday,
                  subExercise: subExerciseMonday,
                  subImg: subImgMonday,
                )),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Tuesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender == "male"
              ? WorkoutForTuesday()
              : Womensworkout(
                  appBarTitle: "Pull Workout",
                  exerciseName: wTuesday,
                  subExercise: subExerciseTuesday,
                  subImg: subImgTuesday,
                )),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Wednesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender == "male"
              ? WorkoutForWednesday()
              : Womensworkout(
                  appBarTitle: "Legs Workout",
                  exerciseName: wWednesday,
                  subExercise: subExerciseWednesday,
                  subImg: subImgWednesday,
                )),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Thursday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender == "male"
              ? WorkoutForThursday()
              : Womensworkout(
                  appBarTitle: "Upper Body Workout",
                  exerciseName: wThursday,
                  subExercise: subExerciseThursday,
                  subImg: subImgThursday,
                )),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Friday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender == "male"
              ? WorkoutForFriday()
              : Womensworkout(
                  appBarTitle: "Lower Body Workout",
                  exerciseName: wFriday,
                  subExercise: subExerciseFriday,
                  subImg: subImgFriday,
                )),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Saturday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender == "male"
              ? WorkoutForSaturday()
              : Womensworkout(
                  exerciseName: exerciseForSaturday,
                  appBarTitle: "Cardio",
                  img: imgForSaturday,
                )

          // Exerciseview(
          //     imgList: imgForSaturday,
          //     exerciseList: exerciseForSaturday,
          //     workoutType: "Cardio",
          //     items: 9,
          //     set: "Till Failure",
          //   )

          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages, backgroundColorMenu: Colors.blueGrey);
  }
}
