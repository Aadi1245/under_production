import 'package:flutter/material.dart';
import 'package:myfitnessapp/Dashboard/collection_view.dart';
import 'package:myfitnessapp/Dashboard/slider.dart';
import 'package:myfitnessapp/Models/simple_slider.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/app_assets.dart';

class Homescreen {
  SimpleImageSliderData? data;
  loadImage() {
    List<SimpleImageSlider> images = List.generate(4, (index) {
      return SimpleImageSlider(imageSrc: AppAssets.img2);
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
                    child: ClipRRect(
                  child: ImageView(
                    AppAssets.img2,
                    // height: MediaQuery.of(context).size.height * 0.35,
                    // width: MediaQuery.of(context).size.width,
                  ),
                )),
                SizedBox(
                  height: 90,
                )
              ],
            )),
      ),
    );
  }
}
