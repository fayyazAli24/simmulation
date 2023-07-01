import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RandsimScreen extends StatelessWidget {
  const RandsimScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());

    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text("StartTime")),
          DataColumn(label: Text("End Time")),
          DataColumn(label: Text("Turnaround time")),
          DataColumn(label: Text("wait time")),
          DataColumn(label: Text("response time")),
        ],
        rows: [
          for (int i = 0; i <10; i++)
            DataRow(cells: [
              DataCell(Text(randomResultScreenController.startTimeList[i].toString())),
              DataCell(Text(randomResultScreenController.endTimeList[i].toString())),
              DataCell(Text(randomResultScreenController.turnAroundTimeList[i].toString())),
              DataCell(Text(randomResultScreenController.waitTimeList[i].toString())),
              DataCell(Text(randomResultScreenController.responseTimeList[i].toString())),
            ])
        ],
      ),
    );
  }
}
