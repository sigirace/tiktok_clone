import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          title: const Text(
            "Hello!",
          ),
          collapsedHeight: 80,
          expandedHeight: 200,
          backgroundColor: Colors.teal,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              'assets/images/maru.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
