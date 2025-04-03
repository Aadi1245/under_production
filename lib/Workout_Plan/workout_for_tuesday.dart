import 'package:flutter/material.dart';
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

                          bottomSheetView(
                              context, "singleMuscle", day, "Chest");
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
                      textOnImageWidget(
                          height: 180,
                          width: 450,
                          text: "Double Muscle",
                          image: AppAssets.appLogo),
                      textOnImageWidget(
                          height: 180,
                          width: 450,
                          text: "Push & Pull Workout",
                          image: AppAssets.appLogo),
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

  void bottomSheetView(
      BuildContext context, String workoutType, String day, String muscle) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomViewData(
          day: day,
          muscle: muscle,
          workoutType: workoutType,
          imgList: img,
        );
      },
    );
  }
}
