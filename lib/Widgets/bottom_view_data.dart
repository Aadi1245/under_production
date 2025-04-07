import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/app_assets.dart';

import '../app_theme.dart';
import '../dashboard_font_size.dart';

class BottomViewData extends StatefulWidget {
  String? workoutType;
  String? day;
  String? muscle;
  List<String>? imgList;
  List<String>? exerciseList;
  String? set;
  int items;
  BottomViewData(
      {super.key,
      this.workoutType,
      this.day,
      this.muscle,
      this.imgList,
      this.exerciseList,
      this.set,
      this.items = 6});

  @override
  State<BottomViewData> createState() => _BottomViewDataState();
}

class _BottomViewDataState extends State<BottomViewData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.workoutType != null ? widget.workoutType! : "Workout",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(children: [
                ...List.generate(widget.items, (index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppTheme.borderColor!),
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      padding: EdgeInsets.all(10.0), // Adjust padding as needed
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Align items vertically
                        children: [
                          // Leading Image Container
                          Container(
                            width: 150, // Adjust width
                            height: 110, // Adjust height
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: AppTheme.lightBorder),
                              borderRadius:
                                  BorderRadius.circular(15), // Rounded corners
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  6), // Match container radius
                              child: ImageView(
                                widget.imgList![index],
                                width: 150, //MediaQuery.of(context).size.width,
                                height:
                                    110, //MediaQuery.of(context).size.width,
                                fit: BoxFit
                                    .cover, // Cover the container area without stretching
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align to the start
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center items vertically
                              children: [
                                Text(
                                  widget.exerciseList![index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: AppTheme.black,
                                        // fontFamily: FontFamily.fontNormal
                                      ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Spacing between title and subtitle
                                ////todo changes here : products counts add here
                                Text(
                                  //   "${menuItems!.length.toString()} items",
                                  widget.set!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: DashboardFontSize
                                            .descFontSize, // Adjust font size as needed
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
