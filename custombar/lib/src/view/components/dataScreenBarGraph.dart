import 'package:custombar/src/services/barData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'dataScreenBarData.dart';

class DataScreenBarGraph extends StatelessWidget {
  final List data;
  final double max;
  DataScreenBarGraph({Key? key, required this.data, required this.max}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dataScreenBarData myBarData = dataScreenBarData(
      first:data[0],
      second:data[1],
      third:data[2],
      fourth:data[3],
      fifth:data[4],
      sixth:data[5],

    );
    myBarData.initializeBarData();
    return BarChart(BarChartData(
        maxY: max,
        minY: 0,
        titlesData: FlTitlesData(
          show: false,

        ),
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
        ).toList()));

  }
}
