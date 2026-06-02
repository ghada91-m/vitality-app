import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../models/progress_model.dart';

class WeightChart extends StatelessWidget {
  final List<WeightPoint> weights;

  const WeightChart({
    super.key,
    required this.weights,
  });

  @override
  Widget build(BuildContext context) {
    if (weights.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text("No weight data available yet."),
        ),
      );
    }

    final minY = weights.map((e) => e.weight).reduce((a, b) => a < b ? a : b) - 0.5;
    final maxY = weights.map((e) => e.weight).reduce((a, b) => a > b ? a : b) + 0.5;

    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Colors.grey.withOpacity(0.18),
              strokeWidth: 1,
            ),
            getDrawingVerticalLine: (_) => FlLine(
              color: Colors.grey.withOpacity(0.12),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.textLight,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= weights.length) {
                    return const SizedBox();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      weights[index].label,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textLight,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipRoundedRadius: 12,
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  final index = spot.x.toInt();
                  return LineTooltipItem(
                    "${weights[index].label}\n${spot.y.toStringAsFixed(1)} kg",
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 4,
              color: AppColors.primary,
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primary.withOpacity(0.12),
              ),
              dotData: FlDotData(show: true),
              spots: List.generate(
                weights.length,
                    (index) => FlSpot(
                  index.toDouble(),
                  weights[index].weight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}