import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class QuickActions extends StatelessWidget {

  final VoidCallback onAddMeal;

  final VoidCallback onRemoveMeal;

  const QuickActions({

    super.key,

    required this.onAddMeal,

    required this.onRemoveMeal,
  });

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Expanded(

          flex: 2,

          child: _PrimaryActionCard(

            title: "Add Meal",

            subtitle:
            "Track today's food",

            icon:
            Icons.restaurant_menu,

            onTap: onAddMeal,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(

          child: Column(

            children: [

              _SecondaryActionCard(

                title: "Remove",

                icon:
                Icons.remove_circle_outline,

                onTap:
                onRemoveMeal,
              ),

              const SizedBox(height: 12),

              _SecondaryActionCard(

                title: "Progress",

                icon:
                Icons.insights_outlined,

                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrimaryActionCard
    extends StatefulWidget {

  final String title;

  final String subtitle;

  final IconData icon;

  final VoidCallback onTap;

  const _PrimaryActionCard({

    required this.title,

    required this.subtitle,

    required this.icon,

    required this.onTap,
  });

  @override
  State<_PrimaryActionCard>
  createState() =>
      _PrimaryActionCardState();
}

class _PrimaryActionCardState
    extends State<_PrimaryActionCard> {

  double scale = 1;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTapDown: (_) {

        setState(() {

          scale = 0.97;
        });
      },

      onTapUp: (_) {

        setState(() {

          scale = 1;
        });

        widget.onTap();
      },

      onTapCancel: () {

        setState(() {

          scale = 1;
        });
      },

      child: AnimatedScale(

        duration:
        const Duration(
          milliseconds: 120,
        ),

        scale: scale,

        child: Container(

          height: 188,

          padding:
          const EdgeInsets.all(20),

          decoration: BoxDecoration(

            gradient:
            LinearGradient(

              colors: [

                AppColors.primary,

                AppColors.primary
                    .withValues(
                  alpha: 0.88,
                ),
              ],
            ),

            borderRadius:
            BorderRadius.circular(
              30,
            ),

            boxShadow: [

              BoxShadow(

                color:
                AppColors.primary
                    .withValues(
                  alpha: 0.18,
                ),

                blurRadius: 22,

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
            CrossAxisAlignment.start,

            children: [

              Container(

                width: 54,

                height: 54,

                decoration: BoxDecoration(

                  color: Colors.white
                      .withValues(
                    alpha: 0.15,
                  ),

                  borderRadius:
                  BorderRadius.circular(
                    18,
                  ),
                ),

                child: Icon(

                  widget.icon,

                  color: Colors.white,

                  size: 28,
                ),
              ),

              const Spacer(),

              Text(

                widget.title,

                style: const TextStyle(

                  color: Colors.white,

                  fontSize: 24,

                  fontWeight:
                  FontWeight.w800,
                ),
              ),

              const SizedBox(height: 6),

              Text(

                widget.subtitle,

                style: const TextStyle(

                  color: Colors.white70,

                  height: 1.5,

                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondaryActionCard
    extends StatelessWidget {

  final String title;

  final IconData icon;

  final VoidCallback onTap;

  const _SecondaryActionCard({

    required this.title,

    required this.icon,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(24),

      onTap: onTap,

      child: Container(

        height: 88,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 16,
        ),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(24),

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

        child: Row(

          children: [

            Container(

              width: 42,

              height: 42,

              decoration: BoxDecoration(

                color:
                AppColors.lightGreen,

                borderRadius:
                BorderRadius.circular(
                  14,
                ),
              ),

              child: Icon(

                icon,

                color:
                AppColors.primary,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(

              child: Text(

                title,

                style: const TextStyle(

                  fontWeight:
                  FontWeight.w700,

                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}