import 'package:flutter/material.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';
import '../app_assets.dart';

class WorkoutForTuesday extends StatefulWidget {
  const WorkoutForTuesday({super.key});

  @override
  State<WorkoutForTuesday> createState() => _WorkoutForTuesdayState();
}

class _WorkoutForTuesdayState extends State<WorkoutForTuesday> {
  String day = "Tuesday";
  List<String> img = [
    AppAssets.straightBar,
    AppAssets.seatedOverheadDumbbell,
    AppAssets.barSkullcrusher,
    AppAssets.ropeTricepExtension,
    AppAssets.underhandTricepExtension,
    AppAssets.benchDip
  ];

  List<String> exerciseName = [
    "Straight Bar Tricep Extension",
    "Seated Overhead Dumbbell Tricep Extension",
    "Bar Skullcrusher",
    "Rope Tricep Extension",
    "Underhand Tricep Extension",
    "Bench Dip"
  ];

  List<String> exerciseName2 = ["Back", "Rear Delts", "Traps", "Biceps", "Abs"];

  List<List<String>> subImg = [
    [AppAssets.pullUps, AppAssets.bentOverRow, AppAssets.seatedCableRow],
    [AppAssets.cableFacePull],
    [AppAssets.dumbbellShrugs],
    [AppAssets.barbellCurl, AppAssets.crossBodyHammerCurlPinwheelCurls],
    [AppAssets.plank, AppAssets.abCrunch]
  ];

  List<List<String>> subExercise = [
    ["Pull-Ups", "Barbell Row", "Seated Cable Row"],
    ["Face Pulls"],
    ["Dumbbell Shrugs"],
    ["Barbell Curls", "Hammer Curls"],
    ["Plank Hold", "Rassian Twist"]
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

                          bottomSheetView(context, "Tricep Workout", day,
                              "tricep", "4 set 15 reps", 6);
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
                                    items: 5,
                                    workoutType: "Pull Workout",
                                    subExercise: subExercise,
                                    subImg: subImg,
                                  )));
                        },
                        child: textOnImageWidget(
                            height: 180,
                            width: 450,
                            text: "Extreme Workout",
                            image: AppAssets.appLogo),
                      ),
                      // textOnImageWidget(
                      //     height: 180,
                      //     width: 450,
                      //     text: "Push & Pull Workout",
                      //     image: AppAssets.appLogo),
                      // textOnImageWidget(
                      //     height: 180,
                      //     width: 450,
                      //     text: "",
                      //     image: AppAssets.appLogo),
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
