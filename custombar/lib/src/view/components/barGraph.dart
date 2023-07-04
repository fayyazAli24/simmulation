import 'package:custombar/src/services/barData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List data;
  final double max;
  MyBarGraph({Key? key, required this.data, required this.max}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      first:data[0],
      second:data[1],
      third:data[2],
      fourth:data[3],
      fifth:data[4],
      sixth:data[5],
      seventh:data[6],
      eight:data[7],
      nineth:data[8],
      tenth:data[9],

    );

    myBarData.initializeBarData();
    return BarChart(BarChartData(
        maxY: max,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.teal,
                      width: 18,
                      borderRadius: BorderRadius.circular(4))
                ],
              ),
            )
            .toList()));
  }
}
