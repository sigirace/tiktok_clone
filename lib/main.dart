import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const Padding(
        padding: EdgeInsets.all(Sizes.size14),
        child: Row(
          children: [
            Text('hello'),
            Gaps.h96,
            Text('bye'),
          ],
        ),
      ),
    );
  }
}
