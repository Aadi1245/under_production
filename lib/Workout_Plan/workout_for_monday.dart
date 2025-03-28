import 'package:flutter/material.dart';
import 'package:myfitnessapp/app_assets.dart';
import '../../../globels.dart' as globals;

class WorkoutForMonday extends StatefulWidget {
  const WorkoutForMonday({super.key});

  @override
  State<WorkoutForMonday> createState() => _WorkoutForMondayState();
}

class _WorkoutForMondayState extends State<WorkoutForMonday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: globals.gender == "male"
            ? Container(
                height: MediaQuery.of(context).size.height,
                // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textOnImageWidget(
                          height: 350,
                          width: 450,
                          text: "Push Pull Workout",
                          image: AppAssets.appLogo),
                      SizedBox(
                        height: 20,
                      ),
                      textOnImageWidget(
                          height: 350,
                          width: 450,
                          text: "Normal Workout",
                          image: AppAssets.appLogo),
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
}
