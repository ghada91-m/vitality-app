import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/constants/colors.dart';

class CaloriesCircle extends StatelessWidget {
  final int remainingCalories;
  final int eatenCalories;
  final int burnedCalories;
  final double progress;

  const CaloriesCircle({
    super.key,
    required this.remainingCalories,
    required this.eatenCalories,
    required this.burnedCalories,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 115,
      lineWidth: 16,
      percent: progress,
      animation: true,
      animationDuration: 700,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.primary,
      backgroundColor: const Color(0xffE5E7E6),
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: Text(
              remainingCalories.toString(),
              key: ValueKey(remainingCalories),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "KCAL REMAINING",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CaloriesInfo(
                value: eatenCalories.toString(),
                label: "EATEN",
                color: AppColors.primary,
              ),

              const SizedBox(width: 25),

              _CaloriesInfo(
                value: burnedCalories.toString(),
                label: "BURNED",
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CaloriesInfo extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _CaloriesInfo({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            value,
            key: ValueKey(value),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 8,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}