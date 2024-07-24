import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/authentication/email_screen.dart';
import 'package:tictok_clone/features/authentication/login_screen.dart';
import 'package:tictok_clone/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/features/authentication/username_screen.dart';
import 'package:tictok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/features/onboarding/interests_screen.dart';
import 'package:tictok_clone/users/user_profile_screen.dart';

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
    GoRoute(
      path: InterestsScreen.routeName,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: MainNavigationScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) {
        final args = state.extra as EmailScreenArgs;
        final getTest = state.queryParams['get_test'];
        return EmailScreen(
          userName: args.userName,
          getTest: getTest,
        );
      },
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        return UserProfileScreen(username: username);
      },
    ),
  ],
);
