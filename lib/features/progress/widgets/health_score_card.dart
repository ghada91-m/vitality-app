import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class HealthScoreCard extends StatelessWidget {
  final int score;

  const HealthScoreCard({
    super.key,
    required this.score,
  });

  String get healthStatus {
    if (score >= 85) return "Excellent";
    if (score >= 70) return "Very Good";
    if (score >= 50) return "Good";
    return "Needs Improvement";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            Color(0xff2ECC71),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  "Health Score",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "$score / 100",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  healthStatus,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Based on BMI, hydration, activity and workouts",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 95,
            height: 95,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 95,
                  height: 95,
                  child: CircularProgressIndicator(
                    value: score / 100,
                    strokeWidth: 10,
                    color: Colors.white,
                    backgroundColor:
                    Colors.white24,
                  ),
                ),

                Text(
                  "$score%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}