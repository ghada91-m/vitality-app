import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class BmiCard extends StatelessWidget {
  final double bmi;
  final String status;
  final int healthScore;

  const BmiCard({
    super.key,
    required this.bmi,
    required this.status,
    required this.healthScore,
  });

  Color get statusColor {
    if (status == "Healthy") return Colors.green;
    if (status == "Overweight") return Colors.orange;
    if (status == "Obese") return Colors.red;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current Health Status",
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: statusColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "BMI ${bmi.toStringAsFixed(1)} • Healthy range 18.5 - 24.9",
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 86,
            height: 86,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: healthScore / 100,
                  strokeWidth: 9,
                  color: statusColor,
                  backgroundColor: statusColor.withOpacity(0.12),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$healthScore",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    const Text(
                      "Score",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}