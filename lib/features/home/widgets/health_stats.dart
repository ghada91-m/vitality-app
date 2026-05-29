import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/services/fitness_service.dart';

class HealthStats extends StatefulWidget {

  final double sleepHours;

  final ValueChanged<double>
  onSleepChanged;

  const HealthStats({

    super.key,

    required this.sleepHours,

    required this.onSleepChanged,
  });

  @override
  State<HealthStats> createState() =>
      _HealthStatsState();
}

class _HealthStatsState
    extends State<HealthStats> {

  int steps = 0;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    loadSteps();
  }

  Future<void> loadSteps() async {

    bool granted =
    await FitnessService
        .requestPermissions();

    if (granted) {

      final result =
      await FitnessService
          .getTodaySteps();

      setState(() {

        steps = result;

        loading = false;
      });

    } else {

      setState(() {

        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Expanded(

          child: _SleepCard(

            sleepHours:
            widget.sleepHours,

            onChanged:
            widget.onSleepChanged,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(

          child: _StepsCard(

            steps: steps,

            loading: loading,
          ),
        ),
      ],
    );
  }
}

class _SleepCard
    extends StatelessWidget {

  final double sleepHours;

  final ValueChanged<double>
  onChanged;

  const _SleepCard({

    required this.sleepHours,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color:
        const Color(0xffF6F1D3),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const Icon(

            Icons.nightlight_round,

            color:
            AppColors.primary,
          ),

          const SizedBox(height: 18),

          Text(

            "${sleepHours.toStringAsFixed(1)}h",

            style: const TextStyle(

              fontSize: 26,

              fontWeight:
              FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          const Text(

            "Sleep Quality",

            style: TextStyle(

              color: Colors.grey,

              fontSize: 12,
            ),
          ),

          Slider(

            value: sleepHours,

            min: 1,

            max: 12,

            activeColor:
            AppColors.primary,

            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _StepsCard
    extends StatelessWidget {

  final int steps;

  final bool loading;

  const _StepsCard({

    required this.steps,

    required this.loading,
  });

  @override
  Widget build(BuildContext context) {

    double progress =
    (steps / 8000)
        .clamp(0, 1);

    return Container(

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color:
        const Color(0xffFCE4DF),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const Icon(

            Icons.directions_walk,

            color:
            AppColors.primary,
          ),

          const SizedBox(height: 18),

          loading

              ? const CircularProgressIndicator()

              : Text(

            steps.toString(),

            style: const TextStyle(

              fontSize: 26,

              fontWeight:
              FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          const Text(

            "Steps Today",

            style: TextStyle(

              color: Colors.grey,

              fontSize: 12,
            ),
          ),

          const SizedBox(height: 14),

          ClipRRect(

            borderRadius:
            BorderRadius.circular(20),

            child: LinearProgressIndicator(

              value: progress,

              minHeight: 8,

              color:
              AppColors.primary,

              backgroundColor:
              Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(

            "${(progress * 100).round()}% of daily goal",

            style: const TextStyle(

              fontSize: 11,

              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}