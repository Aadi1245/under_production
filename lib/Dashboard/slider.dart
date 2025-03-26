import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/Dashboard/video_view.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';

import '../Models/simple_slider.dart';
import '../app_theme.dart';
// import '../../../theme/dashboard_font_size.dart';

class SliderImage extends StatefulWidget {
  // Function(SimpleImageSlider) OnClick;
  SimpleImageSliderData simpleImageSliderData;
  SliderImage(
    this.simpleImageSliderData,
  ); //this.OnClick);

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _height = widget.simpleImageSliderData.height != null
        ? (MediaQuery.of(context).size.height *
            ((widget.simpleImageSliderData.height)! / 100))
        : MediaQuery.of(context).size.height * .20;

    if (widget.simpleImageSliderData.height == 100) {
      _height -= 200;
    } else {
      _height -= 80;
    }
    // var myBool = true;
    // if (widget.imageBannerSliderData.slideHeight! == "Medium") {
    //   //sliderViewType! == "Enlarge") {
    //   myBool = true;
    // } else {
    //   myBool = false;
    // }

    Color indicatorSelectedColor = AppTheme.grayColor;
    Color indicatorUnSelectedColor = AppTheme.grayColor.withAlpha(80);

    List<Widget> carouselItems =
        widget.simpleImageSliderData.simpleImageSlider!.map((item) {
      return InkWell(
          onTap: () {
            // widget.OnClick(item);
          },
          child: item.type == "video"
              ? VideoView(
                  item.videoLink,
                  autoPlay: item.autoPlay,
                  loop: item.loop,
                  height: _height,
                )
              : SliderWidgetImage(item, _height));
    }).toList();

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: CarouselSlider(
              items: carouselItems,
              carouselController: carouselController,
              options: CarouselOptions(
                  enlargeCenterPage: false, //myBool,
                  autoPlay:
                      widget.simpleImageSliderData.simpleImageSlider!.length ==
                              1
                          ? false
                          : widget.simpleImageSliderData.autoSlides ?? true,
                  height: MediaQuery.of(context).size.height * 0.25, //_height,
                  // aspectRatio: 0.93, //16 / 9,
                  // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                  autoPlayCurve: Curves.linear,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: true,
                  viewportFraction:
                      1, // 0.88,// widget.imageBannerSliderData.sliderViewPortFraction!,
                  // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  // seconds: widget.simpleImageSliderData.changeSlidesEvery!),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
          widget.simpleImageSliderData.simpleImageSlider!.length > 1
              ? Positioned(
                  bottom: 5,
                  left: MediaQuery.of(context).size.width / 2.2 -
                      (widget.simpleImageSliderData.simpleImageSlider!.length *
                          5),
                  right: MediaQuery.of(context).size.width / 2.2 -
                      (widget.simpleImageSliderData.simpleImageSlider!.length *
                          5),
                  height: 20,
                  child: Container(
                    width: (widget
                            .simpleImageSliderData.simpleImageSlider!.length *
                        14),
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.simpleImageSliderData.simpleImageSlider!
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 7 : 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? indicatorSelectedColor
                                    : indicatorUnSelectedColor),
                          ),
                        );
                      }).toList(),
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }

  Widget SliderWidgetImage(SimpleImageSlider imageBanner, double _height) {
    // print("------------------->>>>image banner${imageBanner.imageSrc}");
    return Container(
      height: _height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ImageView(imageBanner.imageSrc!, fit: BoxFit.cover),
    );
  }
}
