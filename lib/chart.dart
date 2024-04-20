import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesChart extends StatelessWidget {
  final List<double> actualSales;
  final List<double> forecastedSales;

  const SalesChart(
      {super.key, required this.actualSales, required this.forecastedSales});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> actualSpots = actualSales
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();
    List<FlSpot> forecastSpots = forecastedSales
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: actualSpots,
            isCurved: true,
            color: Colors.red,
            barWidth: 4,
            dotData: const FlDotData(show: true),
          ),
          LineChartBarData(
            spots: forecastSpots,
            isCurved: true,
            color: Colors.green,
            barWidth: 4,
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
