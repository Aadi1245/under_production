// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/Dashboard/video_view.dart';
import 'package:myfitnessapp/app_assets.dart';
// import 'package:myfitnessapp/Dashboard/video_view.dart';
// import 'package:video_player/video_player.dart';

class Shots {
  // late ChewieController chewieController;

  List<String> urls = [
    AppAssets.vid0,
    AppAssets.vid1,
    AppAssets.vid2,
    AppAssets.vid3,
    AppAssets.vid4,
    AppAssets.vid5,
    AppAssets.vid6,
    AppAssets.vid7,
    AppAssets.vid8,
    AppAssets.vid9,
    AppAssets.vid10,
    AppAssets.vid11,
    AppAssets.vid12,
    AppAssets.vid13,
    AppAssets.vid14,
    AppAssets.vid15,
    AppAssets.vid16,
    AppAssets.vid17,
    AppAssets.vid18
  ];

  @override
  Widget shotsWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              18,
              (index) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.yellow,
                    child: VideoView(
                      urls[index],
                      index: index,
                      autoPlay: false,
                    ));
              },
            )),
      ),
    );
  }
}
