import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';

import '../app_theme.dart';
import '../dashboard_font_size.dart';

class Exerciseview extends StatefulWidget {
  List<String>? imgList;
  List<String>? exerciseList;
  Exerciseview({super.key, this.imgList, this.exerciseList});

  @override
  State<Exerciseview> createState() => _ExerciseviewState();
}

class _ExerciseviewState extends State<Exerciseview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "push Workout",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...List.generate(6, (index) {
            return InkWell(
              onTap: () {},
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
                            widget.exerciseList![index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.black,
                                  // fontFamily: FontFamily.fontNormal
                                ),
                          ),
                          // SizedBox(
                          //     height: 5), // Spacing between title and subtitle
                          // ////todo changes here : products counts add here
                          // Text(
                          //   //   "${menuItems!.length.toString()} items",
                          //   " No of items to show",
                          //   style:
                          //       Theme.of(context).textTheme.bodySmall!.copyWith(
                          //             fontSize: DashboardFontSize
                          //                 .descFontSize, // Adjust font size as needed
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          // ),
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
}
