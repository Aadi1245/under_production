import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/dashboard_font_size.dart';
import '../../../globels.dart' as globals;
import '../Utils/utils.dart';
import '../Widgets/webview_pages_screenbody.dart';
import '../app_theme.dart';

class CollectionView extends StatelessWidget {
  String? title;
  CollectionView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 8.0, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              title!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.43,
              // padding:
              //     EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10, right: 10),
              child: GridView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two rows
                  mainAxisSpacing: 5, // Space between the main axis items
                  crossAxisSpacing: 5, // Space between the cross axis items
                  childAspectRatio: 1.37, // Aspect ratio for the items
                ),
                itemCount:
                    globals.allProduct.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WebViewPagesScreen(
                              titleMain: "Product Details",
                              urlToLoad: globals.allProduct[index].url!,
                              // "https://www.amazon.in/MuscleBlaze-Performance-Chocolate-Creatine-Monohydrate/dp/B0CJYCFXSK/?th=1",
                              bodyTags: "")));
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 217, 221),
                            border:
                                Border.all(color: Colors.black, width: 0.01),
                            borderRadius: BorderRadius.all(Radius.circular(
                                DashboardFontSize.customBorderRadius)),
                          ),
                          width: 130,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            child: ImageView(
                                globals.allProduct[index].image.toString()),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (globals.allProduct[index].title!.isNotEmpty)
                          Text(
                            globals.allProduct[index].title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: DashboardFontSize.descFontSize,
                                color: Colors.black
                                // data.textColor == null
                                //     ? AppTheme.primaryColor
                                //     : Utils.getColorFromHex(data.textColor!),
                                ),
                          )
                        else
                          Container(),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
