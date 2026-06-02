import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightChart extends StatelessWidget {

  final List<double> weights;

  const WeightChart({
    super.key,
    required this.weights,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 220,

      child: LineChart(
        LineChartData(
          lineBarsData: [

            LineChartBarData(

              isCurved: true,

              spots:
              List.generate(

                weights.length,

                    (index) => FlSpot(
                  index.toDouble(),
                  weights[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}