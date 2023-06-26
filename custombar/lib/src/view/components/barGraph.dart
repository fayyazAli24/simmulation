import 'package:custombar/src/services/barData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List data;
  MyBarGraph({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        ST: data[0], ET: data[1], TAT: data[2], WT: data[3], RT: data[4]);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.teal,
                      width: 25,
                      borderRadius: BorderRadius.circular(4))
                ],
              ),
            )
            .toList()));
  }
}
