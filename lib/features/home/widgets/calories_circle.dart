import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/constants/colors.dart';

class CaloriesCircle extends StatelessWidget {
  const CaloriesCircle({super.key});

  @override
  Widget build(BuildContext context) {

    return CircularPercentIndicator(

      radius: 115,

      lineWidth: 16,

      percent: 0.72,

      animation: true,

      circularStrokeCap:
      CircularStrokeCap.round,

      progressColor:
      AppColors.primary,

      backgroundColor:
      const Color(0xffE5E7E6),

      center: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: const [

          Text(
            "1,640",

            style: TextStyle(
              fontSize: 40,
              fontWeight:
              FontWeight.bold,

              color:
              AppColors.textDark,
            ),
          ),

          SizedBox(height: 4),

          Text(
            "KCAL REMAINING",

            style: TextStyle(
              fontSize: 10,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          SizedBox(height: 14),

          Row(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              _CaloriesInfo(
                value: "420",
                label: "EATEN",
                color: AppColors.primary,
              ),

              SizedBox(width: 25),

              _CaloriesInfo(
                value: "120",
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

        Text(
          value,

          style: TextStyle(
            fontSize: 12,
            fontWeight:
            FontWeight.bold,

            color: color,
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