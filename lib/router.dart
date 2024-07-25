import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/videos/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: VideoRecordingScreen.routeUrl,
      name: VideoRecordingScreen.routeName,
      builder: (context, state) => const VideoRecordingScreen(),
    ),
  ],
);
