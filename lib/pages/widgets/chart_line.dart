import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

List<Color> gradientColors = [primary, secondary];
LineChartData activityData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: true,
    ),
    titlesData: FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 5,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2.2),
          FlSpot(5, 4),
          FlSpot(6.7, 3.5),
          FlSpot(8, 4.5),
          FlSpot(9.5, 3),
          FlSpot(11, 5),
        ],
        isCurved: true,
        color: primary,
        // colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
            show: true, gradient: LinearGradient(colors: gradientColors)
            // colors:
            //     gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
      ),
    ],
  );
}
