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
          snap: true,
          pinned: true,
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
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.amber[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                  ),
                ),
              ),
              childCount: 50,
            ),
            itemExtent: 100)
      ],
    );
  }
}
