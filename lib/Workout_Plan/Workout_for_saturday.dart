import 'package:flutter/material.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';
import '../app_assets.dart';

class WorkoutForSaturday extends StatefulWidget {
  const WorkoutForSaturday({super.key});

  @override
  State<WorkoutForSaturday> createState() => _WorkoutForSaturdayState();
}

class _WorkoutForSaturdayState extends State<WorkoutForSaturday> {
  String day = "Sturday";
  List<String> img = [
    AppAssets.weightedCrunch,
    AppAssets.plank,
    AppAssets.abCrunch,
    AppAssets.abBicycle,
    AppAssets.hamstringHelperWorkout,
    AppAssets.legExtension,
    AppAssets.weightedSquats,
    AppAssets.legPress,
    AppAssets.legPress
  ];

  List<String> exerciseName = [
    "Weighted Crunch",
    "Plank",
    "ab-Crunch",
    "ab-Bicycle",
    "Hamstring Helper Workout",
    "Leg Extension",
    "Weighted Squats",
    "Leg Press"
  ];

  List<String> exerciseName2 = [
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

  List<String> img2 = [
    AppAssets.forwardLunge,
    AppAssets.bodyWeightSquat,
    AppAssets.mountainClimber,
    AppAssets.running,
    AppAssets.burpees,
    AppAssets.highKick,
    AppAssets.handChestPress,
    AppAssets.sitUps,
    AppAssets.bicycle
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: globals.gender == "male"
            ? Container(
                height: MediaQuery.of(context).size.height,
                // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("clicked --------->>>");

                          bottomSheetView(context, "Abs & Legs Workout", day,
                              "Legs", "4 set 20 reps", 8);
                        },
                        child: textOnImageWidget(
                            height: 180,
                            width: 450,
                            text: "Single Muscle",
                            image: AppAssets.appLogo),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exerciseview(
                                    imgList: img,
                                    exerciseList: exerciseName2,
                                    workoutType: "Cardio",
                                    items: 9,
                                    set: "Till Failure",
                                  )));
                        },
                        child: textOnImageWidget(
                            height: 180,
                            width: 450,
                            text: "Extream Workout",
                            image: AppAssets.appLogo),
                      ),
                    ],
                  ),
                ))
            : Container());
  }

  Widget textOnImageWidget(
      {String text = "Text On Image",
      double height = 250,
      double width = 400,
      String image = AppAssets.img2}) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, //width: 1
              ),
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  void bottomSheetView(BuildContext context, String workoutType, String day,
      String muscle, String set, int items) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomViewData(
          day: day,
          muscle: muscle,
          workoutType: workoutType,
          imgList: img,
          exerciseList: exerciseName,
          set: set,
          items: items,
        );
      },
    );
  }
}
