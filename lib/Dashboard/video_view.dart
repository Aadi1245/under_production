import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

class VideoView extends StatefulWidget {
  final String? url;
  int? index;

  VideoView(this.url,
      {super.key, this.index, bool? autoPlay, bool? loop, double? height});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.url!);

    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      setState(() {});
    }).catchError((error) {
      print("Video initialization error: $error");
    });
  }

//  void _togglePlayPause() {
//     setState(() {
//       if (videoPlayerController.value.isPlaying) {
//         videoPlayerController.pause();
//       } else {
//         videoPlayerController.play();
//       }
//       isPlaying = videoPlayerController.value.isPlaying;
//     });
//   }

  Future<void> _shareAssetVideo() async {
    try {
      // Load the asset video
      ByteData bytes = await rootBundle.load(widget.url!);

      // Get a temporary directory
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/shared_video.mp4';

      // Write asset video to a temporary file
      File file = File(filePath);
      await file.writeAsBytes(bytes.buffer.asUint8List());

      // Share the video
      await Share.shareXFiles([XFile(filePath)], text: 'Check out this video!');
    } catch (e) {
      print("Error sharing video: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error sharing the video.")),
      );
    }
  }

  // List<bool> like = [false, false];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (videoPlayerController.value.isPlaying) {
          videoPlayerController.pause();
        }
      },
      onLongPressUp: () {
        if (!videoPlayerController.value.isPlaying) {
          videoPlayerController.play();
        }
      },
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: 1.9,
              child: Stack(
                children: [
                  VideoPlayer(videoPlayerController),
                  // Positioned(
                  //   top: 430,
                  //   left: 325,
                  //   child: InkWell(
                  //     onTap: () {
                  //       like[widget.index!] == true
                  //           ? like[widget.index!] = false
                  //           : like[widget.index!] = true;
                  //       setState(() {});
                  //     },
                  //     child: Icon(
                  //       size: 32,
                  //       PhosphorIcons.heart,
                  //       color: like[widget.index!] ? Colors.red : Colors.white,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: 20,
                    left: 315,
                    child: InkWell(
                      onTap: _shareAssetVideo,
                      child: Icon(
                        size: 35,
                        PhosphorIcons.share_network_fill, // navigation_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
