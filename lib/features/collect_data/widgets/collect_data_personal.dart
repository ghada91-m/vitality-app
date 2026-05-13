import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/storage/app_preferences.dart';

class CollectDataPersonal
    extends StatefulWidget {

  const CollectDataPersonal({
    super.key,
  });

  @override
  State<CollectDataPersonal> createState() =>
      _CollectDataPersonalState();
}

class _CollectDataPersonalState
    extends State<CollectDataPersonal> {

  String selectedGender = "Female";

  double age = 28;

  double height = 172;

  double weight = 64.5;

  /// BMI
  double get bmi {

    double heightMeter =
        height / 100;

    return weight /
        (heightMeter * heightMeter);
  }

  @override
  void initState() {

    super.initState();

    /// LOAD SAVED DATA
    selectedGender =
        AppPreferences.getGender();

    age =
        AppPreferences
            .getAge()
            .toDouble();

    height =
        AppPreferences
            .getHeight();

    weight =
        AppPreferences
            .getWeight();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 22,
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const SizedBox(height: 12),

          /// TITLE
          const Text.rich(

            TextSpan(

              text: "Tell us about\n",

              style: TextStyle(

                fontSize: 31,

                fontWeight:
                FontWeight.w900,

                height: 1.1,

                color:
                AppColors.textDark,
              ),

              children: [

                TextSpan(

                  text: "yourself.",

                  style: TextStyle(

                    color:
                    AppColors.primary,

                    fontStyle:
                    FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          /// DESCRIPTION
          const Text(

            "Our AI uses these biological markers to create a nutrition plan personalized for your lifestyle.",

            style: TextStyle(

              color:
              AppColors.textLight,

              height: 1.5,

              fontSize: 13,
            ),
          ),

          const SizedBox(height: 28),

          /// GENDER CARD
          buildCard(

            label: "GENDER",

            child: Container(

              height: 50,

              padding:
              const EdgeInsets.all(4),

              decoration: BoxDecoration(

                color:
                AppColors.border,

                borderRadius:
                BorderRadius.circular(
                  30,
                ),
              ),

              child: Row(
                children: [

                  genderButton(
                    title: "Female",
                  ),

                  genderButton(
                    title: "Male",
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// AGE
          numberCard(

            label:
            "BIOLOGICAL AGE",

            value:
            age.round().toString(),

            unit: "yrs",

            sliderValue: age,

            min: 10,

            max: 80,

            onChanged: (value) {

              setState(() {

                age = value;

                AppPreferences
                    .setAge(
                  value.round(),
                );
              });
            },
          ),

          const SizedBox(height: 14),

          /// HEIGHT
          numberCard(

            label:
            "CURRENT HEIGHT",

            value:
            height.round().toString(),

            unit: "cm",

            sliderValue: height,

            min: 120,

            max: 220,

            onChanged: (value) {

              setState(() {

                height = value;

                AppPreferences
                    .setHeight(
                  value,
                );
              });
            },
          ),

          const SizedBox(height: 14),

          /// WEIGHT
          numberCard(

            label:
            "CURRENT WEIGHT",

            value:
            weight
                .toStringAsFixed(1),

            unit: "kg",

            sliderValue: weight,

            min: 35,

            max: 150,

            onChanged: (value) {

              setState(() {

                weight = value;

                AppPreferences
                    .setWeight(
                  value,
                );
              });
            },
          ),

          const SizedBox(height: 22),

          /// BMI CARD
          Container(

            width: double.infinity,

            padding:
            const EdgeInsets.all(
              22,
            ),

            decoration: BoxDecoration(

              gradient:
              LinearGradient(

                colors: [

                  AppColors.primary,

                  AppColors.primary
                      .withValues(
                    alpha: 0.85,
                  ),
                ],
              ),

              borderRadius:
              BorderRadius.circular(
                28,
              ),

              boxShadow: [

                BoxShadow(

                  color:
                  AppColors.primary
                      .withValues(
                    alpha: 0.20,
                  ),

                  blurRadius: 20,

                  offset:
                  const Offset(
                    0,
                    10,
                  ),
                ),
              ],
            ),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                const Text(

                  "BODY MASS INDEX",

                  style: TextStyle(

                    color:
                    Colors.white70,

                    fontSize: 11,

                    fontWeight:
                    FontWeight.w900,

                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(
                  height: 14,
                ),

                Row(
                  children: [

                    Text(

                      bmi
                          .toStringAsFixed(
                        1,
                      ),

                      style:
                      const TextStyle(

                        color:
                        Colors.white,

                        fontSize: 42,

                        fontWeight:
                        FontWeight.w900,
                      ),
                    ),

                    const Spacer(),

                    Container(

                      padding:
                      const EdgeInsets
                          .symmetric(

                        horizontal: 16,

                        vertical: 8,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        Colors.white
                            .withValues(
                          alpha: 0.18,
                        ),

                        borderRadius:
                        BorderRadius
                            .circular(
                          20,
                        ),
                      ),

                      child:
                      const Text(

                        "Healthy",

                        style:
                        TextStyle(

                          color:
                          Colors.white,

                          fontWeight:
                          FontWeight
                              .w800,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 14,
                ),

                const Text(

                  "Your BMI is automatically calculated based on your height and weight.",

                  style: TextStyle(

                    color:
                    Colors.white70,

                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// CARD
  Widget buildCard({

    required String label,

    required Widget child,

  }) {

    return Container(

      width: double.infinity,

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: AppColors.white,

        borderRadius:
        BorderRadius.circular(26),

        boxShadow: [

          BoxShadow(

            color: Colors.black
                .withValues(
              alpha: 0.03,
            ),

            blurRadius: 18,

            offset:
            const Offset(0, 8),
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(

            label,

            style: const TextStyle(

              color:
              AppColors.textLight,

              fontSize: 10,

              fontWeight:
              FontWeight.w900,

              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 16),

          child,
        ],
      ),
    );
  }

  /// GENDER BUTTON
  Widget genderButton({

    required String title,

  }) {

    bool selected =
        selectedGender == title;

    return Expanded(

      child: GestureDetector(

        onTap: () {

          setState(() {

            selectedGender = title;

            AppPreferences
                .setGender(
              title,
            );
          });
        },

        child: AnimatedContainer(

          duration:
          const Duration(
            milliseconds: 250,
          ),

          alignment:
          Alignment.center,

          decoration: BoxDecoration(

            color: selected
                ? AppColors.white
                : Colors.transparent,

            borderRadius:
            BorderRadius.circular(
              24,
            ),
          ),

          child: Text(

            title,

            style: TextStyle(

              color: selected
                  ? AppColors.primary
                  : AppColors.textLight,

              fontWeight:
              FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  /// NUMBER CARD
  Widget numberCard({

    required String label,

    required String value,

    required String unit,

    required double sliderValue,

    required double min,

    required double max,

    required ValueChanged<double>
    onChanged,

  }) {

    return buildCard(

      label: label,

      child: Column(
        children: [

          Row(

            crossAxisAlignment:
            CrossAxisAlignment.end,

            children: [

              Text(

                value,

                style: const TextStyle(

                  fontSize: 36,

                  fontWeight:
                  FontWeight.w900,

                  color:
                  AppColors.textDark,
                ),
              ),

              const SizedBox(width: 8),

              Padding(

                padding:
                const EdgeInsets.only(
                  bottom: 7,
                ),

                child: Text(

                  unit,

                  style: const TextStyle(

                    color:
                    AppColors.textDark,

                    fontWeight:
                    FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          Slider(

            value: sliderValue,

            min: min,

            max: max,

            activeColor:
            AppColors.primary,

            inactiveColor:
            AppColors.border,

            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}