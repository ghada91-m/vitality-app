import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../models/user_model.dart';
class BmiCard extends StatelessWidget {
  final UserModel user;

  const BmiCard({
    super.key,
    required this.user,
  });

  double get bmi {
    final heightInMeter = user.height / 100;
    return user.weight / (heightInMeter * heightInMeter);
  }

  String get status {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Healthy';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  double get progress {
    final value = bmi / 40;
    if (value > 1) return 1;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.yellowCard,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: AppColors.primary,
              ),
              SizedBox(width: 8),
              Text(
                'BMI',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: AppColors.white,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Healthy BMI range: 18.5 - 24.9',
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}