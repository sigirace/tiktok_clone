import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/authentication/login_screen.dart';
import 'package:tictok_clone/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/features/authentication/username_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
  ],
);
