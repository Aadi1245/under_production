import 'package:flutter/material.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';
import '../app_assets.dart';

class WorkoutForWednesday extends StatefulWidget {
  const WorkoutForWednesday({super.key});

  @override
  State<WorkoutForWednesday> createState() => _WorkoutForWednesdayState();
}

class _WorkoutForWednesdayState extends State<WorkoutForWednesday> {
  String day = "Wednesday";
  List<String> img = [
    AppAssets.bentOverRow,
    AppAssets.seatedCableRow,
    AppAssets.tBarRow,
    AppAssets.reverseGripBentoverRow,
    AppAssets.oneArmSeatedCableRow,
    AppAssets.machineRow
  ];

  List<String> exerciseName = [
    "BentOver Row",
    "seated Cable Row",
    "T-Bar Row",
    "Reverse Grip Bentover Row",
    "One Arm Seated Cable Row",
    "Machine Row"
  ];

  List<String> exerciseName2 = [
    "Quads",
    "Hamstrings",
    "Calves",
    "Abs",
  ];

  List<List<String>> subImg = [
    [
      AppAssets.weightedSquats,
      AppAssets.legPress,
      AppAssets.bulgarianSplitSquats
    ],
    [AppAssets.romanDeadlift, AppAssets.lyingLeg],
    [AppAssets.seatedCalf],
    [AppAssets.declineSitups, AppAssets.sidePlank]
  ];

  List<List<String>> subExercise = [
    ["Back Squats", "Leg Press", "Bulgarian Split Squats"],
    ["Roman Deadlifts", "Lying Leg Curls"],
    ["Seated Calf Raises"],
    ["Decline Sit-Ups", "Side Plank"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
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

                          bottomSheetView(context, "Back Workout", day, "Back",
                              "4 set 15 reps", 6);
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
                                    workoutType: "Legs Workout",
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
