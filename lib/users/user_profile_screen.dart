import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/users/widgets/my_information.dart';

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
          title: const Text("시기"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                size: Sizes.size20,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Gaps.v10,
              const CircleAvatar(
                radius: Sizes.size52,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/31294995?v=4",
                ),
                child: Text(
                  "sigi",
                ),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "@sigi",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.h5,
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    size: Sizes.size16,
                    color: Colors.blue.shade500,
                  ),
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const userInfo(
                      content: "Followers",
                      number: "10M",
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size12,
                      endIndent: Sizes.size12,
                    ),
                    const userInfo(
                      content: "Following",
                      number: "93",
                    ),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size12,
                      endIndent: Sizes.size12,
                    ),
                    const userInfo(
                      content: "Likes",
                      number: "194.3M",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
