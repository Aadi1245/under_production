import 'package:flutter/material.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';
import '../app_assets.dart';

class WorkoutForThursday extends StatefulWidget {
  const WorkoutForThursday({super.key});

  @override
  State<WorkoutForThursday> createState() => _WorkoutForThursdayState();
}

class _WorkoutForThursdayState extends State<WorkoutForThursday> {
  String day = "Thursday";
  List<String> img = [
    AppAssets.inclineDumbbellCurlThumb,
    AppAssets.barbellCurl,
    AppAssets.cableCurl,
    AppAssets.crossBodyHammerCurlPinwheelCurls,
    AppAssets.seatedConcentrationCurl,
    AppAssets.ezBarPreacherCurl
  ];

  List<String> exerciseName = [
    "Incline Dumbbell Curl Thumb",
    "Barbell Curl",
    "Cable Curl",
    "Cross Body Hammer Curl Pinwheel Curls",
    "Seated Concentration Curl",
    "Bar Preacher Curl"
  ];

  List<String> exerciseName2 = [
    "Back",
    "Chest",
    "Shoulders",
    "Byceps",
    "Triceps",
  ];

  List<List<String>> subImg = [
    [
      AppAssets.inclineBenchPress,
      AppAssets.dumbbellBenchPress,
    ],
    [AppAssets.dumbbellBenchPress, AppAssets.seatedCableRow],
    [AppAssets.straightBar],
    [AppAssets.barSkullcrusher],
    [AppAssets.plank]
  ];

  List<List<String>> subExercise = [
    ["Dead Lift", "Pull-Ups"],
    ["Incline Dumbbell Press", "Cable Crossovers"],
    ["Arnold Press"],
    ["Concentration Curls"],
    ["Close-Grip Bench Press"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.greenAccent,
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

                          bottomSheetView(context, "Bycep Workout", day,
                              "Bycep", "4 set 15 reps", 6);
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
                                    workoutType: "Upper Workout",
                                    subExercise: subExercise,
                                    set: "3 set 10 reps",
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
