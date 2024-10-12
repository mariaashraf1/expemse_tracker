import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseChart extends StatelessWidget {
  final Map<String, double> expensesByDayOfWeek;

  ExpenseChart(this.expensesByDayOfWeek, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          minimum: 0, // Set the minimum value of x-axis
          maximum: 32, // Set the maximum value of x-axis
          interval: 7, // Set the interval to 1 (step)
          arrangeByIndex: true,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          axisLine: AxisLine(width: 2,color: Colors.white),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 1),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          majorGridLines: const MajorGridLines(width: 0),
           axisLine: AxisLine(width: 2,color: Colors.white),
        ),
        series: <ChartSeries>[
          ColumnSeries<MapEntry<String, double>, String>(
            dataSource: expensesByDayOfWeek.entries.toList(),
            xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
            yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
            color: Colors.white, // Bar color
            borderRadius: BorderRadius.circular(15),
          ),
        ],
      ),
    );
  }
}
