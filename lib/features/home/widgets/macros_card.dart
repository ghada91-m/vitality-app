import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MacrosCard extends StatelessWidget {

  const MacrosCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding:
      const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(30),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withValues(
              alpha: 0.04,
            ),

            blurRadius: 18,

            offset:
            const Offset(0, 10),
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// HEADER
          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: const [

                  Text(

                    "Nutrition",

                    style: TextStyle(

                      fontSize: 22,

                      fontWeight:
                      FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(

                    "Today's macro balance",

                    style: TextStyle(

                      color: Colors.grey,

                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              Container(

                padding:
                const EdgeInsets.symmetric(

                  horizontal: 14,
                  vertical: 8,
                ),

                decoration: BoxDecoration(

                  color:
                  AppColors.lightGreen,

                  borderRadius:
                  BorderRadius.circular(
                    18,
                  ),
                ),

                child: const Text(

                  "AI Insight",

                  style: TextStyle(

                    color:
                    AppColors.primary,

                    fontWeight:
                    FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// CALORIES
          const Text(

            "1,240 kcal consumed",

            style: TextStyle(

              fontSize: 16,

              fontWeight:
              FontWeight.w700,
            ),
          ),

          const SizedBox(height: 24),

          const _MacroProgress(

            emoji: "🥩",

            title: "Protein",

            value: "84g / 120g",

            percentage: "70%",

            progress: 0.7,

            color: AppColors.primary,
          ),

          SizedBox(height: 18),

          const _MacroProgress(

            emoji: "🍞",

            title: "Carbs",

            value: "110g / 200g",

            percentage: "55%",

            progress: 0.55,

            color: Colors.orange,
          ),

          SizedBox(height: 18),

          const _MacroProgress(

            emoji: "🥑",

            title: "Fats",

            value: "42g / 70g",

            percentage: "60%",

            progress: 0.6,

            color: Colors.purple,
          ),

          const SizedBox(height: 24),

          /// AI MESSAGE
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color:
              AppColors.lightGreen,

              borderRadius:
              BorderRadius.circular(
                22,
              ),
            ),

            child: const Row(

              children: [

                Icon(

                  Icons.auto_awesome,

                  color:
                  AppColors.primary,
                ),

                SizedBox(width: 12),

                Expanded(

                  child: Text(

                    "AI suggests increasing protein intake after your recent activity.",

                    style: TextStyle(

                      height: 1.5,

                      fontWeight:
                      FontWeight.w500,
                    ),
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

class _MacroProgress
    extends StatelessWidget {

  final String emoji;

  final String title;

  final String value;

  final String percentage;

  final double progress;

  final Color color;

  const _MacroProgress({

    required this.emoji,

    required this.title,

    required this.value,

    required this.percentage,

    required this.progress,

    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Row(

          children: [

            Text(
              emoji,
              style:
              const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(

              child: Text(

                title,

                style: const TextStyle(

                  fontSize: 15,

                  fontWeight:
                  FontWeight.w700,
                ),
              ),
            ),

            Text(

              percentage,

              style: TextStyle(

                color: color,

                fontWeight:
                FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ClipRRect(

          borderRadius:
          BorderRadius.circular(20),

          child: LinearProgressIndicator(

            value: progress,

            minHeight: 10,

            color: color,

            backgroundColor:
            color.withValues(
              alpha: 0.12,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Align(

          alignment:
          Alignment.centerRight,

          child: Text(

            value,

            style: const TextStyle(

              color: Colors.grey,

              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}