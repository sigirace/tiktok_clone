import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int itemcount = 4;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  void _onPageChaged(int index) {
    setState(() {
      itemcount = itemcount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: itemcount,
      onPageChanged: _onPageChaged,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Container(
        color: colors[(index + 1) % 4],
        child: Center(
          child: Text(
            'Screen $index',
            style: const TextStyle(
              fontSize: Sizes.size32,
            ),
          ),
        ),
      ),
    );
  }
}
