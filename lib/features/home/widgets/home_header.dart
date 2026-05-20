import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        Row(

          children: [

            CircleAvatar(

              radius: 20,

              backgroundColor:
              AppColors.primary,

              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),

            const SizedBox(width: 10),

            Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: const [

                Text(
                  "Welcome back,",

                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  "Vitality",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,

                    color:
                    AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),

        Container(

          padding:
          const EdgeInsets.all(10),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
            BorderRadius.circular(14),
          ),

          child: const Icon(
            Icons.notifications_none,

            color:
            AppColors.primary,
          ),
        ),
      ],
    );
  }
}