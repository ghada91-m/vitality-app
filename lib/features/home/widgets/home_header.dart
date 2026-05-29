import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HomeHeader extends StatelessWidget {

  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final today =
    DateTime.now();

    final date =
        "${today.day}/${today.month}/${today.year}";

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        /// LEFT SIDE
        Row(

          children: [

            Container(

              width: 54,

              height: 54,

              decoration: BoxDecoration(

                gradient:
                LinearGradient(

                  colors: [

                    AppColors.primary,

                    AppColors.secondary,
                  ],
                ),

                borderRadius:
                BorderRadius.circular(
                  18,
                ),
              ),

              child: const Icon(

                Icons.person,

                color: Colors.white,

                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  date,

                  style: const TextStyle(

                    color: Colors.grey,

                    fontSize: 11,

                    fontWeight:
                    FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(

                  "Welcome back 👋",

                  style: TextStyle(

                    fontSize: 14,

                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(

                  "Ghada",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                    FontWeight.w800,

                    color:
                    AppColors.textDark,
                  ),
                ),
              ],
            ),
          ],
        ),

        /// NOTIFICATION
        Container(

          width: 50,

          height: 50,

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
            BorderRadius.circular(
              18,
            ),

            boxShadow: [

              BoxShadow(

                color:
                Colors.black.withValues(
                  alpha: 0.04,
                ),

                blurRadius: 18,

                offset:
                const Offset(0, 8),
              ),
            ],
          ),

          child: Stack(

            alignment: Alignment.center,

            children: [

              const Icon(

                Icons.notifications_none,

                color:
                AppColors.primary,

                size: 28,
              ),

              Positioned(

                top: 14,

                right: 14,

                child: Container(

                  width: 9,

                  height: 9,

                  decoration: const BoxDecoration(

                    color: Colors.red,

                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}