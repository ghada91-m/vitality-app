import 'package:flutter/material.dart';

class CameraPreviewCard extends StatelessWidget {
  const CameraPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius:
        BorderRadius.circular(30),
      ),

      child: ClipRRect(
        borderRadius:
        BorderRadius.circular(30),

        child: Image.asset(
          "assets/images/ai_cam.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}