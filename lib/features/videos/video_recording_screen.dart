import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  static const String routeUrl = '/';
  static const String routeName = 'video_recording_screen';
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;
  bool _cameraDenied = false;
  bool _micDenied = false;
  late final CameraController _cameraController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _checkPermission() async {
    _cameraDenied = await Permission.camera.isDenied ||
        await Permission.camera.isPermanentlyDenied;
    _micDenied = await Permission.microphone.isDenied ||
        await Permission.microphone.isPermanentlyDenied;

    if (!_cameraDenied && !_micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  void openAppSetting() async => await openAppSettings();

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();
  }

  Future<void> initPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await _checkPermission();
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        onRefresh: _checkPermission,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: !_hasPermission || !_cameraController.value.isInitialized
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Initializing...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Gaps.v20,
                    ElevatedButton(
                      onPressed: () => openAppSetting(),
                      child: const Text("Open app settings"),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          _refreshIndicatorKey.currentState!.show(),
                      child: const Text("Permission reflash"),
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    CameraPreview(_cameraController),
                  ],
                ),
        ),
      ),
    );
  }
}
