import 'package:custombar/src/controller/gantChartController.dart';
import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/components/LineChart.dart';
import 'package:custombar/src/view/components/barGraph.dart';
import 'package:custombar/src/view/components/customGantChartMultiServer.dart';
import 'package:custombar/src/view/components/customGantChartSingleServer.dart';
import 'package:custombar/src/view/components/graphName.dart';
import 'package:custombar/src/view/components/statsResult.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphicalResultScreen extends StatelessWidget {
  GraphicalResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    ChartController chartController = Get.put(ChartController());
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());
    return GetBuilder(
        init: randomResultScreenController,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Center(
                    child: Text(
                  "Graphical illustration of Data",
                  style: TextStyle(fontSize: 16.sp),
                )),
                SizedBox(
                  height: 3.h,
                ),
                Center(child: GraphName(graphName: "GantChart ")),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: randomResultScreenController.servers.value == 2
                          ? MultiServerGanttChart(
                              customers:
                                  randomResultScreenController.gantChartData)
                          : SingleServerGanttChart(
                              customers:
                                  randomResultScreenController.gantChartData)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: GraphName(
                            graphName: "customer time distribution",
                          ),
                        ),
                        Container(
                          // height: 40.h,
                          child: PieChart(
                            chartRadius: 200,
                            dataMap: chartController.dataMap,
                            legendOptions: LegendOptions(
                                legendPosition: LegendPosition.right),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GraphName(graphName: "ST & ET"),
                        SizedBox(height: 3.h),
                        Container(
                          width: 65.w,
                          height: 60.h,
                          child: CustomLineChart(),
                        ),
                      ],
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
                            data: chartController.barData,
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
                            data: chartController.barData,
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
                            data: chartController.barData,
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
                        parameter: "Avg Wait time",
                        time: 2,
                        color: Colors.blue),
                    StatsResult(
                        parameter: "Avg Service time",
                        time: 2,
                        color: Colors.red),
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
                        parameter: "Avg Wait Time",
                        time: 2,
                        color: Colors.black),
                    StatsResult(
                        parameter: "Server1 Idle Time",
                        time: 2,
                        color: Colors.black),
                    StatsResult(
                        parameter: "Server 1 Utilization Time",
                        time: 2,
                        color: Colors.green),
                    StatsResult(
                        parameter: "Server 2 Idle",
                        time: 2,
                        color: Colors.black),
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
        });
  }
}
