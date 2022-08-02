import 'package:flutter/material.dart';
import 'package:instagram_try2/widget/videoPlayerWidget.dart';
import 'package:video_player/video_player.dart';

import '../main.dart';

class MyVid extends StatefulWidget {
  @override
  State<MyVid> createState() => _MyVidState();
}

class _MyVidState extends State<MyVid> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/video/VideoMe.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void selectPage(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        //navigate to HomePage
        return InstagramHomePAge();
      }));
    }
    return MaterialApp(
      home: Scaffold(
        body: 
      ),
    );
  }
}
