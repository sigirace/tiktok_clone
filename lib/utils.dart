import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  final snack = SnackBar(
    content: Text(
      (error as FirebaseException).message ?? "An error occurred",
    ),
    showCloseIcon: true,
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
