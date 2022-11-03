import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChapterVideoPlayer extends StatefulWidget {
  const ChapterVideoPlayer({Key? key, required this.chapterVideos})
      : super(key: key);

  final String chapterVideos;
  @override
  State<ChapterVideoPlayer> createState() => _ChapterVideoPlayerState();
}

class _ChapterVideoPlayerState extends State<ChapterVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() {
    videoPlayerController = VideoPlayerController.network(widget.chapterVideos);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Chewie(
        controller: chewieController,
      )),
    );
  }
}
