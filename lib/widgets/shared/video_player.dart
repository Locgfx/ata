import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../constants/colors.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoLink;
  const VideoPlayerWidget({Key? key, required this.videoLink})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  // late ChewieController chewieController;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    //AutoOrientation.landscapeAutoMode();
    super.initState();
    _controller = VideoPlayerController.network(widget.videoLink)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //AutoOrientation.portraitAutoMode();
    _controller.dispose();
    super.dispose();
  }

  double value = 0.0;

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  bool _hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_hide == true) {
              setState(() {
                _hide = false;
              });
            } else {
              setState(() {
                _hide = true;
              });
            }
          },
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Container(
                  width: 1.sw,
                  height: 1.sh,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _hide ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IconButton(
                        onPressed: _hide
                            ? () {}
                            : () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                                if (_controller.value.isPlaying) {
                                  setState(() {
                                    _hide = true;
                                  });
                                } else {
                                  _hide = false;
                                }
                              },
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                _hide
                    ? SizedBox.shrink()
                    : Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          // padding: EdgeInsets.symmetric(vertical: 20),
                          color: Colors.black38,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                _hide
                    ? SizedBox.shrink()
                    : Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder(
                              builder: (context, VideoPlayerValue val, child) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Text(
                                    _videoDuration(val.position) +
                                        " / " +
                                        _videoDuration(val.duration),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                              valueListenable: _controller,
                            ),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                  playedColor: k006D77,
                                  bufferedColor: Colors.white,
                                  backgroundColor: kD9D9D9),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 24),
                            ),
                            // Slider(
                            //   value: value,
                            //   activeColor: k006D77,
                            //   inactiveColor: kD9D9D9,
                            //   onChanged: (val) {
                            //     setState(() {
                            //       value = val;
                            //       _controller.seekTo(Duration(
                            //           seconds: _controller.value.position.inSeconds));
                            //     });
                            //   },
                            //   min: 0.0,
                            //   max: _controller.value.duration.inSeconds.toDouble(),
                            // ),
                          ],
                        ),
                      ),
              ],
            ),
            // child: Stack(
            //   children: [
            //     AspectRatio(
            //       //   width: 1.sw,
            //       //   height: 1.sh,
            //       aspectRatio: _controller.value.aspectRatio,
            //       child: VideoPlayer(_controller),
            //     ),
            //     Positioned(
            //         top: 0,
            //         left: 0,
            //         right: 0,
            //         child: Container(
            //           color: Colors.black,
            //           child: Row(
            //             children: [
            //               Container(
            //                 width: 100,
            //                 height: 100,
            //                 color: Colors.green,
            //               )
            //             ],
            //           ),
            //         )),
            //     Positioned(
            //       right: 25,
            //       bottom: 25,
            //       child: Icon(
            //         _controller.value.isPlaying
            //             ? Icons.pause_circle
            //             : Icons.play_circle,
            //         size: 50,
            //         color: k006D77,
            //       ),
            //     ),
            //     Positioned(
            //       top: 25,
            //       left: 10,
            //       child: InkWell(
            //         onTap: () {
            //           Navigator.of(context).pop();
            //         },
            //         child: Container(
            //           color: Colors.transparent,
            //           padding: EdgeInsets.all(10),
            //           child: Icon(
            //             Icons.arrow_back,
            //             size: 40,
            //             color: k006D77,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
