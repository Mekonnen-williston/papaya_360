import 'package:flutter/material.dart';
import 'package:video_360/video_360.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  Video360Controller? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Video360View(
                  onVideo360ViewCreated: (controller) {
                    this.controller = controller;
                    this.controller?.play();
                  },
                  url:
                      'https://codetricity.github.io/flutter_video_display/ageda.MP4',
                  onPlayInfo: (Video360PlayInfo info) {},
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    controller?.play();
                  },
                  color: Colors.grey[100],
                  child: Text('Play'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.stop();
                  },
                  color: Colors.grey[100],
                  child: Text('Stop'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.reset();
                  },
                  color: Colors.grey[100],
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
