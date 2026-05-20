import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HydrationCard extends StatelessWidget {

  const HydrationCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: AppColors.lightGreen,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(

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
                    "Hydration",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Target 2.5 Liters",

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              Text(
                "1.2 L",

                style: TextStyle(
                  fontWeight:
                  FontWeight.bold,

                  fontSize: 20,

                  color:
                  AppColors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(

            children: [

              ...List.generate(
                4,
                    (index) => const Padding(

                  padding:
                  EdgeInsets.only(right: 8),

                  child: Icon(
                    Icons.local_drink,

                    color:
                    AppColors.primary,
                  ),
                ),
              ),

              ...List.generate(
                3,
                    (index) => const Padding(

                  padding:
                  EdgeInsets.only(right: 8),

                  child: Icon(
                    Icons.local_drink_outlined,

                    color: Colors.grey,
                  ),
                ),
              ),

              const Spacer(),

              Container(

                padding:
                const EdgeInsets.all(8),

                decoration: BoxDecoration(

                  color: Colors.white,

                  shape: BoxShape.circle,
                ),

                child: const Icon(

                  Icons.add,

                  color:
                  AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}