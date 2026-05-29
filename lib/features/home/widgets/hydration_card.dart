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

  final int targetCups = 8;

  double get liters => cups * 0.3125;

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

      padding:
      const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: AppColors.lightGreen,

        borderRadius:
        BorderRadius.circular(30),

        boxShadow: [

          BoxShadow(

            color:
            AppColors.primary.withValues(
              alpha: 0.08,
            ),

            blurRadius: 20,

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

                    "Hydration",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight:
                      FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(

                    "Daily water target",

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

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Text(

                  "${liters.toStringAsFixed(1)} L",

                  style: const TextStyle(

                    fontWeight:
                    FontWeight.w800,

                    fontSize: 16,

                    color:
                    AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// WATER CUPS
          Row(

            children: [

              Expanded(

                child:
                SingleChildScrollView(

                  scrollDirection:
                  Axis.horizontal,

                  child: Row(

                    children: List.generate(

                      targetCups,

                          (index) {

                        final filled =
                            index < cups;

                        return Padding(

                          padding:
                          const EdgeInsets.only(
                            right: 10,
                          ),

                          child:
                          AnimatedContainer(

                            duration:
                            const Duration(
                              milliseconds: 250,
                            ),

                            width: 42,

                            height: 42,

                            decoration:
                            BoxDecoration(

                              color: filled
                                  ? AppColors.primary
                                  : Colors.white,

                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: Icon(

                              Icons.local_drink,

                              color: filled
                                  ? Colors.white
                                  : Colors.grey,

                              size: 22,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// REMOVE BUTTON
              InkWell(

                borderRadius:
                BorderRadius.circular(
                  14,
                ),

                onTap: removeCup,

                child: Container(

                  width: 44,

                  height: 44,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(
                      14,
                    ),
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
              InkWell(

                borderRadius:
                BorderRadius.circular(
                  14,
                ),

                onTap: addCup,

                child: Container(

                  width: 44,

                  height: 44,

                  decoration: BoxDecoration(

                    color:
                    AppColors.primary,

                    borderRadius:
                    BorderRadius.circular(
                      14,
                    ),
                  ),

                  child: const Icon(

                    Icons.add,

                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// PROGRESS
          ClipRRect(

            borderRadius:
            BorderRadius.circular(20),

            child: LinearProgressIndicator(

              value: cups / targetCups,

              minHeight: 9,

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