import 'package:flutter/material.dart';
import 'package:mi_zone/Constants/constants.dart';
import 'package:mi_zone/screens/HomePage.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text("aa"),
            Expanded(child: VideoApp()),
          ],
        ),
      ),
    );
  }
}

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("lib/assets/videos/intro_sample1.mov")
          ..initialize().then((_) {
            _controller.play().then((value) {});
            _controller.addListener(checkVideo);
            setState(() {});
          });
  }

  void checkVideo() {
    // Check the video playback status
    if (_controller.value.position == _controller.value.duration) {
      // Video has ended, navigate to HomePage
      _controller.removeListener(checkVideo); // Remove the listener
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  @override
  void dispose() {
    _controller.removeListener(checkVideo); // Clean up the controller listener
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: MediaQuery.of(context).size.width /
                                  MediaQuery.of(context).size.height,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                    Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.ctaColorLight,
                                  borderRadius: BorderRadius.circular(36)),
                              height: 35,
                              child: Center(
                                  child: Text(
                                "Continue",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        /*       floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),*/
      ),
    );
  }
}
