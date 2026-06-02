import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius:
        BorderRadius.circular(24),
      ),

      child: const Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Text(
            "SCORE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),

          Text(
            "A+",
            style: TextStyle(
              color: Colors.white,
              fontWeight:
              FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}