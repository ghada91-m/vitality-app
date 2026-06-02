import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class AiTipCard extends StatelessWidget {
  const AiTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
      ),

      child: const Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Text(
            "AI Recommendation",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "Drink water before your next meal 💧",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}