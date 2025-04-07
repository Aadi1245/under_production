import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/app_assets.dart';

import '../Widgets/bottom_view_data.dart';
import '../app_theme.dart';
import '../dashboard_font_size.dart';

class Exerciseview extends StatefulWidget {
  List<String>? imgList;
  List<String>? exerciseList;
  String? workoutType;
  int items;
  String? exercise;
  List<List<String>>? subExercise;
  List<List<String>>? subImg;
  String? set;
  Exerciseview(
      {super.key,
      this.imgList,
      this.exerciseList,
      this.workoutType,
      this.items = 6,
      this.exercise,
      this.subExercise,
      this.subImg,
      this.set = "4 set 15 reps"});

  @override
  State<Exerciseview> createState() => _ExerciseviewState();
}

class _ExerciseviewState extends State<Exerciseview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.workoutType != null ? widget.workoutType! : "push Workout",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...List.generate(widget.items, (index) {
            return InkWell(
              onTap: () {
                widget.subExercise != null
                    ? bottomSheetView(
                        context: context,
                        workoutType: widget.exerciseList![index],
                        set: widget.set,
                        items: widget.subExercise![index].length,
                        exerciseName: widget.subExercise![index],
                        img: widget.subImg![index])
                    : "";
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppTheme.borderColor!),
                  // borderRadius:
                  //     BorderRadius.circular(15), // Rounded corners
                ),
                // padding: EdgeInsets.all(10.0), // Adjust padding as needed
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Align items vertically
                  children: [
                    // Leading Image Container
                    Container(
                      width: 170, // Adjust width
                      height: 200, // Adjust height
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppTheme.lightBorder),
                        // borderRadius:
                        //     BorderRadius.circular(15), // Rounded corners
                      ),
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(
                        //     6), // Match container radius
                        child: ImageView(
                          widget.imgList![index],
                          width: 150, //MediaQuery.of(context).size.width,
                          height: 200, //MediaQuery.of(context).size.width,
                          fit: BoxFit
                              .cover, // Cover the container area without stretching
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align to the start
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center items vertically
                        children: [
                          Text(
                            // widget.exercise != null
                            //     ? widget.exercise!
                            //     : "
                            widget.exerciseList![index], //",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize:
                                      widget.workoutType == "Cardio" ? 20 : 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.black,
                                  // fontFamily: FontFamily.fontNormal
                                ),
                          ),
                          widget.workoutType == "Cardio"
                              ? SizedBox(height: 5)
                              : Container(), // Spacing between title and subtitle
                          ////todo changes here : products counts add here
                          widget.workoutType == "Cardio"
                              ? Text(
                                  //   "${menuItems!.length.toString()} items",
                                  widget.set!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.red,
                                        fontSize: DashboardFontSize
                                            .descFontSize, // Adjust font size as needed
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
        ]),
      ),
    );
  }

  List<String> img = [
    AppAssets.dumbbellBenchPress,
    AppAssets.inclineBenchPress,
    AppAssets.dumbbellPullover,
    AppAssets.dumbbellFly,
    AppAssets.standingCable,
    AppAssets.machineFly
  ];

  void bottomSheetView(
      {BuildContext? context,
      String? workoutType,
      String? day,
      String? muscle,
      String? set,
      int? items,
      List<String>? exerciseName,
      List<String>? img}) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context!,
      builder: (context) {
        return BottomViewData(
          day: day,
          muscle: muscle,
          workoutType: workoutType,
          imgList: img,
          exerciseList: exerciseName,
          set: set,
          items: items!,
        );
      },
    );
  }
}
