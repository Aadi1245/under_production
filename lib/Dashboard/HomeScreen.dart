import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitnessapp/Dashboard/collection_view.dart';
import 'package:myfitnessapp/Dashboard/dietPlan.dart';
import 'package:myfitnessapp/Dashboard/slider.dart';
import 'package:myfitnessapp/Models/simple_slider.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/app_assets.dart';

class Homescreen {
  SimpleImageSliderData? data;

  List<String> slidImage = [
    AppAssets.slider0,
    AppAssets.slider1,
    AppAssets.slider2,
    AppAssets.img2
  ];

  loadImage() {
    List<SimpleImageSlider> images = List.generate(4, (index) {
      return SimpleImageSlider(imageSrc: slidImage[index]);
    });

    data = SimpleImageSliderData(height: 350, simpleImageSlider: images);
  }

  @override
  Widget homeWidget(BuildContext context) {
    loadImage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                SliderImage(data!),
                CollectionView("Recommended Products"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Get Your Diet Plan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {
                      showDialogueForDiedPlan(context);
                    },
                    child: ClipRRect(
                      child: ImageView(
                        // width: MediaQuery.of(context).size.width * 1.2,
                        fit: BoxFit.cover,

                        AppAssets.dietPlanImg,

                        // height: MediaQuery.of(context).size.height * 0.35,
                        // width: MediaQuery.of(context).size.width,
                      ),
                    )),
                SizedBox(
                  height: 70,
                )
              ],
            )),
      ),
    );
  }

  showDialogueForDiedPlan(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedGoal = 'Weight Loss';
        String selectedMealType = 'Vegetarian';

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Get Diet Plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                  child: Icon(Icons.cancel_outlined),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Goal"),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedGoal,
                                    items: [
                                      'Weight Loss',
                                      'Weight Gain',
                                      'Muscle Gain',
                                    ]
                                        .map((goal) => DropdownMenuItem(
                                              value: goal,
                                              child: Text(goal),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGoal = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text("Meal Type"),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedMealType,
                                    items: [
                                      'Vegetarian',
                                      'Vegan',
                                      'Non-Vegetarian',
                                    ]
                                        .map((meal) => DropdownMenuItem(
                                              value: meal,
                                              child: Text(meal),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMealType = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Call your method using selectedGoal and selectedMealType
                                        print("Goal: $selectedGoal");
                                        print("Meal Type: $selectedMealType");

                                        bool goBack = (Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => DietPlan(
                                                      goal: selectedGoal,
                                                      mealType:
                                                          selectedMealType,
                                                    )))) as bool;
                                        if (goBack) {
                                          print("Under the if condition");

                                          context.pop();
                                        }
                                      },
                                      child: Text("Get Diet Plan"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
