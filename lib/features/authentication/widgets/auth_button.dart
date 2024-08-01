import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/view_models/signup_view_model.dart';
import 'package:tictok_clone/features/authentication/view_models/social_auth_view_model.dart';

class AuthButton extends ConsumerWidget {
  final String text;
  final FaIcon icon;
  final Widget? link;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.link,
  });

  void _onTap(BuildContext context, WidgetRef ref) {
    if (link != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => link!,
        ),
      );
    } else {
      ref.read(socialAuthProvider.notifier).githubSignIn(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _onTap(context, ref),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
