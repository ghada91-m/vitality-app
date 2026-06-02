import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../widgets/camera_preview_card.dart';
import '../widgets/nutrition_card.dart';

class AiScanScreen extends StatelessWidget {
  const AiScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: const [

              SizedBox(height: 10),

              CameraPreviewCard(),

              SizedBox(height: 24),

              Text(
                "ANALYSIS RESULT",
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 8),

              NutritionCard(),
            ],
          ),
        ),
      ),
    );
  }
}