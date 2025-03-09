import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (!isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CameraPreview(controller!),
        ),
        IconButton(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          color: Colors.red,
          iconSize: 100,
        )
      ],
    );
  }

  Future<void> _takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      print("Camera controller not initialized");
      return;
    }
    
    try {
      final XFile file = await controller!.takePicture();
      print("Picture taken at: ${file.path}");
      
      try {
        await Gal.putImage(file.path);
        print("Picture saved to gallery");
      } catch (e) {
        print("Error saving to gallery: $e");
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _setupCamera() async {
    try {
      List<CameraDescription> availableCams = await availableCameras();
      
      if (availableCams.isNotEmpty) {
        setState(() {
          cameras = availableCams;
          // Use the back camera (first camera)
          controller = CameraController(cameras.first, ResolutionPreset.high);
        });
        
        // Wait for controller to initialize
        await controller!.initialize();
        
        if (mounted) {
          setState(() {
            isInitialized = true;
          });
        }
      }
    } catch (e) {
      print("Error setting up camera: $e");
    }
  }
}