import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tictok_clone/firebase_options.dart';
import 'package:tictok_clone/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.signOut();
  });

  testWidgets("Create Account Flow", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TikTokApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text("Already have an account?"), findsOneWidget);
    expect(find.text("Log in"), findsOneWidget);
    await tester.tap(find.text("Log in"));
    await tester.pumpAndSettle(const Duration(seconds: 20));

    final emailBtn = find.text("Use email & password");
    expect(emailBtn, findsOneWidget);
    await tester.tap(emailBtn);
    await tester.pumpAndSettle();

    final usernameInput = find.byType(TextField).first;
    await tester.enterText(usernameInput, 'sigi');
    await tester.pumpAndSettle();
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();

    final emailInput = find.byType(TextField).first;
    await tester.enterText(emailInput, 'kang@gmail.com');

    final passwordInput = find.byType(TextField).first;
    await tester.enterText(passwordInput, '123456789!@#');
    await tester.pumpAndSettle();

    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
  });
}
