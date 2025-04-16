import 'package:flutter/material.dart';
import 'package:myfitnessapp/Models/user_data.dart';
import 'package:myfitnessapp/Utils/session.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
// import 'package:myfitnessapp/Workout_Plan/womensWorkout.dart'
//     show Womensworkout;
import 'package:myfitnessapp/app_assets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';

class WorkoutForMonday extends StatefulWidget {
  const WorkoutForMonday({super.key});

  @override
  State<WorkoutForMonday> createState() => _WorkoutForMondayState();
}

class _WorkoutForMondayState extends State<WorkoutForMonday> {
  String day = "Monday";
  List<String> img = [
    AppAssets.dumbbellBenchPress,
    AppAssets.inclineBenchPress,
    AppAssets.dumbbellPullover,
    AppAssets.dumbbellFly,
    AppAssets.standingCable,
    AppAssets.machineFly
  ];

  List<String> exerciseName = [
    "Dumbbell Bench Press",
    "Incline Bench Press",
    "Dumbbell Pullover",
    "Dumbbell Fly",
    "Standing Cable",
    "Machine Fly"
  ];

  List<String> exerciseName2 = [
    "Chest",
    "Shoulders",
    "Triceps",
    "Abs",
  ];

  List<List<String>> subImg = [
    [
      AppAssets.barbellBenchPress,
      AppAssets.dumbbellBenchPress,
      AppAssets.dumbbellFly
    ],
    [AppAssets.dumbbellLateralRaise],
    [AppAssets.tricepDip, AppAssets.ropeTricepExtension],
    [AppAssets.hangingLegRaise, AppAssets.cableCrunch]
  ];

  List<List<String>> subExercise = [
    ["Bench Press", "Dumbbell press", "Dumbbell Flyes"],
    ["Lateral Raises"],
    ["tricep Dips", "Rope Pushdowns"],
    ["Hanginig Leg Raises", "Cable Crunches"]
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getInfo() async {
    Session userInfo = Session();
    UserData? user = await userInfo.getUserData();
    globals.gender = user!.gender;
  }

  @override
  Widget build(BuildContext context) {
    getInfo();
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

                          bottomSheetView(context, "Chest Workout", day,
                              "Chest", "4 set 15 reps", 6);
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
                                    items: 4,
                                    workoutType: "Push Workout",
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

                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => Womensworkout(
                      //               exerciseName: exerciseName2,
                      //               appBarTitle: "Push Workout",
                      //             )));
                      //   },
                      //   child: textOnImageWidget(
                      //       height: 180,
                      //       width: 450,
                      //       text: "Womens Workout",
                      //       image: AppAssets.appLogo),
                      // ),
                      // textOnImageWidget(
                      //     height: 180,
                      //     width: 450,
                      //     text: "Home Workout",
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
        return Container(
          height: 800, //MediaQuery.of(context).size.height * 1.5,
          child: BottomViewData(
            day: day,
            muscle: muscle,
            workoutType: workoutType,
            imgList: img,
            exerciseList: exerciseName,
            set: set,
            items: items,
          ),
        );
      },
    );
  }
}
