import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class MGSscreen extends StatelessWidget {
   MGSscreen({Key? key}) : super(key: key);
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text("S/NO")),
          DataColumn(label: Text("Cummulative probablity")),
          DataColumn(label: Text("CP look-up")),
          DataColumn(label: Text("AVG time B/W arrival")),
          DataColumn(label: Text("Interarrival time")),
          DataColumn(label: Text("arrival time")),
          DataColumn(label: Text("service time")),
        ],
        rows: [
          for (int i = 0; i < 10; i++)
            DataRow(cells: [
              DataCell(Text(list[i].toString())),
              DataCell(Text(randomResultScreenController.probablityList[i]
                  .toStringAsFixed(4).toString())),
              DataCell(i==0?Text(i.toString()):Text(randomResultScreenController.probablityList[i-1]
                  .toStringAsFixed(4).toString())),
              DataCell(Text(i.toString())),
              DataCell(Text(randomResultScreenController.interArrivalList[i].toString())),
              DataCell(Text(randomResultScreenController.arrivalList[i].toString())),
              // if(randomResultScreenController.MGoptions.value == 2)
                DataCell(Text(randomResultScreenController.serviceList[i].toString()))
              ,
              // if(randomResultScreenController.MGoptions.value == 1)
                // DataCell(Text(randomResultScreenController.uniformServiceList[i].toString())),
              // if(randomResultScreenController.MGoptions.value == 3)
                // DataCell(Text(randomResultScreenController.gamaServiceList[i].toString()))
            ])
        ],
      ),
    );
  }
}
