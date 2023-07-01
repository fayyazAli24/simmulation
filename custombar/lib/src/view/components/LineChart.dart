import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
   CustomLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 20,
        lineBarsData: [
          LineChartBarData(
            spots: [
               FlSpot(1,4),
              FlSpot(2,2),
              FlSpot(3,3),
              FlSpot(4,8),
              FlSpot(5,6),
              FlSpot(6,4),
            ],color: Color(0xffFF0000)
          ),
          LineChartBarData(
            spots: [
               FlSpot(1,5),
              FlSpot(2,2),
              FlSpot(3,3),
              FlSpot(4,6),
              FlSpot(5,7),
              FlSpot(6,4),
            ],color:const Color(0xff008080)
          ),
        ],titlesData: FlTitlesData(

      )
      )
    );
  }
}
