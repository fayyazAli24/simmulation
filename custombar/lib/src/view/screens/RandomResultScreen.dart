import 'package:flutter/material.dart';

class RandomResultScreen extends StatelessWidget {
  const RandomResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Cummulative probablity")),
        DataColumn(label: Text("CP look-up")),
        DataColumn(label: Text("AVG time B/W arrival")),
        DataColumn(label: Text("Interarrival time")),
        DataColumn(label: Text("arrival time")),
        DataColumn(label: Text("service time")),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text("0.3345")),
          DataCell(Text("0")),
          DataCell(Text("1")),
          DataCell(Text("3")),
          DataCell(Text("0")),
          DataCell(Text("2")),
        ])
      ],
    );
  }
}
