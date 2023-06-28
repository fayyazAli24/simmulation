import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RandomResultScreen extends StatelessWidget {

  var list = [1,2,3,4,5,6,7,8,9,9];
   RandomResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return DataTable(
      columns: const [
        DataColumn(label: Text("S/NO")),
        DataColumn(label: Text("Cummulative probablity")),
        DataColumn(label: Text("CP look-up")),
        DataColumn(label: Text("AVG time B/W arrival")),
        DataColumn(label: Text("Interarrival time")),
        DataColumn(label: Text("arrival time")),
        DataColumn(label: Text("service time")),
      ],
      rows:  [
        for (int i = 0; i < 7; i++)
          DataRow(cells: [
                DataCell(Text(list[i].toString())),
                DataCell(Text(randomResultScreenController.probablityList[i].toString())),
                DataCell(Text(list[i].toString())),
                DataCell(Text(list[i].toString())),
                DataCell(Text(list[i].toString())),
                DataCell(Text(list[i].toString())),
                DataCell(Text(list[i].toString()))
        ])
      ],
    );
  }
}
