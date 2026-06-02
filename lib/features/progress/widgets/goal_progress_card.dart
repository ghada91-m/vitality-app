import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class GoalProgressCard extends StatelessWidget {
  final double currentWeight;
  final double targetWeight;
  final double progress;

  const GoalProgressCard({
    super.key,
    required this.currentWeight,
    required this.targetWeight,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = (currentWeight - targetWeight).abs();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Weight Goal",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _GoalItem(
                  title: "Current",
                  value: "${currentWeight.toStringAsFixed(1)} kg",
                ),
              ),
              Expanded(
                child: _GoalItem(
                  title: "Target",
                  value: "${targetWeight.toStringAsFixed(1)} kg",
                ),
              ),
              Expanded(
                child: _GoalItem(
                  title: "Remaining",
                  value: "${remaining.toStringAsFixed(1)} kg",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              color: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(0.12),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(progress * 100).round()}% of your goal completed",
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final String title;
  final String value;

  const _GoalItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textLight,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textDark,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}