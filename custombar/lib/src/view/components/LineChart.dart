import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  List<FlSpot> list1;
  List<FlSpot> list2;
  double max;

  CustomLineChart({Key? key, required this.list1,required this.list2,required this.max}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: max,
        lineBarsData: [
          LineChartBarData(
            spots:list1
            ,color: Color(0xffFF0000)
          ),
          LineChartBarData(
            spots: list2
              ,color:const Color(0xff008080)
          ),
        ]
      )
    );
  }
}
