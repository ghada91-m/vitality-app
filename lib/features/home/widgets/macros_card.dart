import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MacrosCard extends StatelessWidget {

  const MacrosCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: const [

              Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "MACROS",

                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Protein focus day",

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Icon(
                Icons.restaurant,

                color:
                AppColors.primary,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const _MacroProgress(
            title: "PROTEIN",
            value: "84G / 120G",
            progress: 0.7,
            color: AppColors.primary,
          ),

          SizedBox(height: 16),

          const _MacroProgress(
            title: "CARBS",
            value: "110G / 200G",
            progress: 0.5,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class _MacroProgress extends StatelessWidget {

  final String title;
  final String value;
  final double progress;
  final Color color;

  const _MacroProgress({

    required this.title,
    required this.value,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

          children: [

            Text(
              title,

              style: const TextStyle(
                fontSize: 11,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            Text(
              value,

              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        ClipRRect(

          borderRadius:
          BorderRadius.circular(20),

          child: LinearProgressIndicator(

            value: progress,

            minHeight: 7,

            color: color,

            backgroundColor:
            Colors.grey.shade200,
          ),
        ),
      ],
    );
  }
}