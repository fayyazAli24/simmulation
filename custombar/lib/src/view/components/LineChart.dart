import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomLineChart extends StatelessWidget {
  List<FlSpot> list1;
  List<FlSpot> list2;
  double max;

  CustomLineChart({Key? key, required this.list1,required this.list2,required this.max}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: double.tryParse(randomResultScreenController.customerNumber.value.toString()),
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
