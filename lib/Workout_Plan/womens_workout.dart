import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/bottom_view_data.dart' show BottomViewData;
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import 'package:myfitnessapp/app_assets.dart';
import '../../../globels.dart' as globals;

class Womensworkout extends StatefulWidget {
  List<String>? exerciseName;
  List<String>? img;
  String? appBarTitle;
  List<List<String>>? subExercise;
  List<List<String>>? subImg;
  Womensworkout(
      {super.key,
      this.exerciseName,
      this.appBarTitle,
      this.subExercise,
      this.subImg,
      this.img});

  @override
  State<Womensworkout> createState() => _WomensworkoutState();
}

class _WomensworkoutState extends State<Womensworkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.appBarTitle !=null? widget.appBarTitle! :"Extream Workoute"),
      // ),
      body: widget.appBarTitle != "Cardio"
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.appBarTitle != null
                            ? widget.appBarTitle!
                            : "Extream Workoute",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...List.generate(widget.exerciseName!.length, (index) {
                      return InkWell(
                        onTap: () {
                          bottomSheetView(context,
                              workoutType: widget.exerciseName![index],
                              set: "4 set 15 reps",
                              subExercise: widget.subExercise![index],
                              subImg: widget.subImg![index],
                              items: widget.subImg![index].length);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.womensWorkout),
                              fit: BoxFit
                                  .cover, // makes sure the image fills the container
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(
                                  0.3), // adds semi-transparent overlay
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                widget.exerciseName![index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Exerciseview(
                          imgList: widget.img,
                          exerciseList: widget.exerciseName,
                          workoutType: "Cardio",
                          items: 9,
                          set: "Till Failure",
                        )));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // border: Border.all(width: 1, color: Colors.grey),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1595078475328-1ab05d0a6a0e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zml0bmVzcyUyMGdpcmx8ZW58MHx8MHx8fDA%3D"),
                    fit: BoxFit
                        .cover, // makes sure the image fills the container
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withAlpha(80), // adds semi-transparent overlay
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      widget.appBarTitle!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 85,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void bottomSheetView(BuildContext context,
      {String? workoutType,
      String? day,
      String? muscle,
      String? set,
      int? items,
      List<String>? subExercise,
      List<String>? subImg}) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // height: 800, //MediaQuery.of(context).size.height * 1.5,
          child: BottomViewData(
            // day: day,
            // muscle: muscle,
            workoutType: workoutType,
            imgList: subImg,
            exerciseList: subExercise,
            set: set,
            items: items!,
          ),
        );
      },
    );
  }
}
