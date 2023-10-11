import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RandomResultScreen extends StatelessWidget {
  RandomResultScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController =
    Get.put(RandomResultScreenController());
    return SingleChildScrollView(
      child: DataTable(
        columns:  [
          DataColumn(label: Text("S/NO")),
          DataColumn(label: Text("Cummulative probablity")),
          DataColumn(label: Text("CP look-up")),
          DataColumn(label: Text("AVG time B/W arrival")),
          DataColumn(label: Text("Interarrival time")),
          DataColumn(label: Text("arrival time")),
          DataColumn(label: Text("service time")),
          if(randomResultScreenController.isPriority.value == true)
            DataColumn(label: Text("priority")),
        ],
        rows: [
          for (int i = 0; i < randomResultScreenController.customerNumber.value; i++)
            DataRow(cells: [
              DataCell(Text((i+1).toString())),
              DataCell(Text(randomResultScreenController.probablityList[i]
                  .toStringAsFixed(4).toString())),
              DataCell(i==0?Text(i.toString()):Text(randomResultScreenController.probablityList[i-1]
                  .toStringAsFixed(4).toString())),
              DataCell(Text(i.toString())),
              DataCell(Text(randomResultScreenController.interArrivalList[i].toString())),
              DataCell(Text(randomResultScreenController.arrivalList[i].toString())),
              DataCell(Text(randomResultScreenController.serviceList[i].toString())),

              if(randomResultScreenController.isPriority.value == true)
                DataCell(Text(randomResultScreenController.priorityList[i].toString())),

            ])
        ],
      ),
    );
  }
}
