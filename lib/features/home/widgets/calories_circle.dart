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

    return Container(

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        boxShadow: [

          BoxShadow(

            color:
            AppColors.primary.withValues(
              alpha: 0.08,
            ),

            blurRadius: 30,

            offset:
            const Offset(0, 16),
          ),
        ],
      ),

      child: CircularPercentIndicator(

        radius: 120,

        lineWidth: 18,

        percent: progress,

        animation: true,

        animationDuration: 900,

        circularStrokeCap:
        CircularStrokeCap.round,

        backgroundColor:
        const Color(0xffE8ECEA),

        linearGradient: LinearGradient(

          colors: [

            AppColors.primary,

            AppColors.secondary,
          ],
        ),

        center: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(

              padding:
              const EdgeInsets.symmetric(

                horizontal: 14,
                vertical: 6,
              ),

              decoration: BoxDecoration(

                color:
                AppColors.lightGreen,

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: const Text(

                "Daily Goal",

                style: TextStyle(

                  fontSize: 11,

                  fontWeight:
                  FontWeight.w700,

                  color:
                  AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 16),

            AnimatedSwitcher(

              duration:
              const Duration(
                milliseconds: 400,
              ),

              child: Text(

                remainingCalories.toString(),

                key:
                ValueKey(
                  remainingCalories,
                ),

                style: const TextStyle(

                  fontSize: 44,

                  fontWeight:
                  FontWeight.w800,

                  color:
                  AppColors.textDark,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Text(

              "KCAL REMAINING",

              style: TextStyle(

                fontSize: 11,

                letterSpacing: 1.2,

                color: Colors.grey,

                fontWeight:
                FontWeight.w600,
              ),
            ),

            const SizedBox(height: 22),

            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                _CaloriesInfo(

                  value:
                  eatenCalories
                      .toString(),

                  label:
                  "EATEN",

                  color:
                  AppColors.primary,

                  icon:
                  Icons.restaurant,
                ),

                const SizedBox(width: 26),

                _CaloriesInfo(

                  value:
                  burnedCalories
                      .toString(),

                  label:
                  "BURNED",

                  color:
                  Colors.orange,

                  icon:
                  Icons.local_fire_department,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CaloriesInfo
    extends StatelessWidget {

  final String value;

  final String label;

  final Color color;

  final IconData icon;

  const _CaloriesInfo({

    required this.value,

    required this.label,

    required this.color,

    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Container(

          width: 42,

          height: 42,

          decoration: BoxDecoration(

            color:
            color.withValues(
              alpha: 0.10,
            ),

            borderRadius:
            BorderRadius.circular(
              14,
            ),
          ),

          child: Icon(

            icon,

            color: color,

            size: 22,
          ),
        ),

        const SizedBox(height: 8),

        AnimatedSwitcher(

          duration:
          const Duration(
            milliseconds: 300,
          ),

          child: Text(

            value,

            key: ValueKey(value),

            style: TextStyle(

              fontSize: 15,

              fontWeight:
              FontWeight.w700,

              color: color,
            ),
          ),
        ),

        const SizedBox(height: 2),

        Text(

          label,

          style: const TextStyle(

            fontSize: 10,

            color: Colors.grey,

            fontWeight:
            FontWeight.w600,
          ),
        ),
      ],
    );
  }
}