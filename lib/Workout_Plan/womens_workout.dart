import 'package:flutter/material.dart';
import 'package:myfitnessapp/app_assets.dart';

class Womensworkout extends StatefulWidget {
  List<String>? exerciseName;
  Womensworkout({super.key, this.exerciseName});

  @override
  State<Womensworkout> createState() => _WomensworkoutState();
}

class _WomensworkoutState extends State<Womensworkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(widget.exerciseName!.length, (index) {
                return Container(
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
                      color: Colors.black
                          .withOpacity(0.3), // adds semi-transparent overlay
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        widget.exerciseName![index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
