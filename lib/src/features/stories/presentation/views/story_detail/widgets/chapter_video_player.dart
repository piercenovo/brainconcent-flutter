import 'package:brainconcent_flutter/src/core/utils/colors.dart';
import 'package:brainconcent_flutter/src/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
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
  ChewieController? chewieController;

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network(widget.chapterVideos);
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      // aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      // autoPlay: false,
      // looping: false,
      // fullScreenByDefault: true,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          _initPlayer();
          setState(() {});
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeH!;
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: chewieController != null &&
                chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: chewieController!,
              )
            : Container(
                color: kBackgroundColor,
                child: Center(
                  child: Lottie.asset(
                    'assets/json/rotate-phone.json',
                    height: height * 40,
                    width: width * 50,
                  ),
                ),
              ));
  }
}
