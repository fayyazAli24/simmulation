import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChartDataScreen extends StatelessWidget {
  List<FlSpot> list1;
   CustomLineChartDataScreen({Key? key,required this.list1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
        LineChartData(
            minX: 0,
            maxX: 130,
            minY: 0,
            maxY: 20,
            lineBarsData: [
              LineChartBarData(
                  spots:list1
                  ,color: const Color(0xffFF0000)
              ),
            ],titlesData: FlTitlesData(
          show: false,
        )
        )
    );
  }
}
