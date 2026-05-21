import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HydrationCard extends StatefulWidget {

  const HydrationCard({super.key});

  @override
  State<HydrationCard> createState() =>
      _HydrationCardState();
}

class _HydrationCardState
    extends State<HydrationCard> {

  int cups = 4;

  final int targetCups = 7;

  double get liters =>
      cups * 0.3;

  void addCup() {

    if (cups < targetCups) {

      setState(() {

        cups++;
      });
    }
  }

  void removeCup() {

    if (cups > 0) {

      setState(() {

        cups--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(

      duration:
      const Duration(milliseconds: 300),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: AppColors.lightGreen,

        borderRadius:
        BorderRadius.circular(28),

        boxShadow: [

          BoxShadow(

            color:
            AppColors.primary.withOpacity(0.08),

            blurRadius: 20,

            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(

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

                    "Hydration",

                    style: TextStyle(

                      fontSize: 19,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(

                    "Target 2.1 Liters",

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              AnimatedSwitcher(

                duration:
                const Duration(milliseconds: 300),

                child: Text(

                  "${liters.toStringAsFixed(1)} L",

                  key: ValueKey(liters),

                  style: const TextStyle(

                    fontWeight:
                    FontWeight.bold,

                    fontSize: 22,

                    color:
                    AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// WATER CUPS
          Row(

            children: [

              ...List.generate(

                targetCups,

                    (index) {

                  final filled =
                      index < cups;

                  return Padding(

                    padding:
                    const EdgeInsets.only(
                        right: 8),

                    child: AnimatedContainer(

                      duration:
                      const Duration(
                          milliseconds: 250),

                      child: Icon(

                        filled
                            ? Icons.local_drink
                            : Icons.local_drink_outlined,

                        color: filled
                            ? AppColors.primary
                            : Colors.grey.shade400,

                        size: 28,
                      ),
                    ),
                  );
                },
              ),

              const Spacer(),

              /// REMOVE BUTTON
              GestureDetector(

                onTap: removeCup,

                child: Container(

                  padding:
                  const EdgeInsets.all(10),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    shape: BoxShape.circle,

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.black.withOpacity(0.05),

                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: const Icon(

                    Icons.remove,

                    color:
                    AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              /// ADD BUTTON
              GestureDetector(

                onTap: addCup,

                child: Container(

                  padding:
                  const EdgeInsets.all(10),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    shape: BoxShape.circle,

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.black.withOpacity(0.05),

                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: const Icon(

                    Icons.add,

                    color:
                    AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// PROGRESS BAR
          ClipRRect(

            borderRadius:
            BorderRadius.circular(20),

            child: LinearProgressIndicator(

              value: cups / targetCups,

              minHeight: 8,

              color: AppColors.primary,

              backgroundColor:
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}