import 'package:custombar/src/view/components/barGraph.dart';
import 'package:custombar/src/view/components/graphName.dart';
import 'package:custombar/src/view/components/statsResult.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphicalResultScreen extends StatelessWidget {
  GraphicalResultScreen({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    "avg TAT": 5,
    "avg ST": 2,
    "avg WT": 4,
    "avg RT": 1,
  };

  var barData = [10, 21, 80, 40, 45];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "Graphical illustration of Data",
            style: TextStyle(fontSize: 16.sp),
          )),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: GraphName(
                        graphName: "customer time dist",
                      ),
                    ),
                    PieChart(
                      dataMap: dataMap,
                      legendOptions:
                          LegendOptions(legendPosition: LegendPosition.right),
                      chartValuesOptions:
                          ChartValuesOptions(showChartValuesInPercentage: true),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: GraphName(
                        graphName: "TAT & WT",
                      ),
                    ),
                    PieChart(
                      dataMap: dataMap,
                      legendOptions:
                          LegendOptions(legendPosition: LegendPosition.right),
                      chartValuesOptions:
                          ChartValuesOptions(showChartValuesInPercentage: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  GraphName(graphName: "Interarrival time"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 40.h,
                    width: 30.w,
                    child: MyBarGraph(
                      data: barData,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GraphName(graphName: "arrival time"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 40.h,
                    width: 30.w,
                    child: MyBarGraph(
                      data: barData,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GraphName(graphName: "service time"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 40.h,
                    width: 30.w,
                    child: MyBarGraph(
                      data: barData,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Text(
              "Statistical analysis of data",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsResult(
                  parameter: "Avg Turn around time",
                  time: 2,
                  color: Colors.black),
              StatsResult(
                  parameter: "Avg Wait time", time: 2, color: Colors.blue),
              StatsResult(
                  parameter: "Avg Service time", time: 2, color: Colors.red),
              StatsResult(
                  parameter: "Avg Inter Arrival time",
                  time: 2,
                  color: Colors.green)
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsResult(
                  parameter: "Avg Wait Time", time: 2, color: Colors.black),
              StatsResult(
                  parameter: "Server1 Idle Time", time: 2, color: Colors.black),
              StatsResult(
                  parameter: "Server 1 Utilization Time",
                  time: 2,
                  color: Colors.green),
              StatsResult(
                  parameter: "Server 2 Idle", time: 2, color: Colors.black),
              StatsResult(
                  parameter: "Server 2 Utilization Time",
                  time: 2,
                  color: Colors.green)
            ],
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
