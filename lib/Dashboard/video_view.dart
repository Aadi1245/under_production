import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

class VideoView extends StatefulWidget {
  final String? url;
  const VideoView(this.url, {super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url!),
    );

    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      setState(() {});
    }).catchError((error) {
      print("Video initialization error: $error");
    });
  }

  Future<void> _downloadAndShareVideo() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/shared_video.mp4';

      // Download the video using Dio
      await Dio().download(widget.url!, filePath);

      // Share the downloaded file
      await Share.shareXFiles([XFile(filePath)], text: 'Check out this video!');
    } catch (ex) {
      print("Exception thrown by share: $ex");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to share the video.")));
    }
  }

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
                  Positioned(
                    top: 430,
                    left: 300,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        size: 32,
                        PhosphorIcons.heart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 500,
                    left: 300,
                    child: Transform.rotate(
                      angle: 45.6,
                      child: InkWell(
                        onTap: _downloadAndShareVideo,
                        child: const Icon(
                          size: 35,
                          PhosphorIcons.navigation_arrow,
                          color: Colors.white,
                        ),
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
