// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/Dashboard/video_view.dart';
// import 'package:myfitnessapp/Dashboard/video_view.dart';
import 'package:video_player/video_player.dart';

class Shots {
  // late ChewieController chewieController;

  List<String> urls = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ];

  @override
  Widget shotsWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              2,
              (index) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.yellow,
                    child: VideoView(urls[index]));
              },
            )),
      ),
    );
  }
}
