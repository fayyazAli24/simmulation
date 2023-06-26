import 'package:flutter/material.dart';

class RandsimScreen extends StatelessWidget {
  const RandsimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("StartTime")),
        DataColumn(label: Text("End Time")),
        DataColumn(label: Text("Turnaround time")),
        DataColumn(label: Text("wait time")),
        DataColumn(label: Text("response time")),

      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text("0")),
          DataCell(Text("0")),
          DataCell(Text("1")),
          DataCell(Text("3")),
          DataCell(Text("0")),

        ])
      ],
    );
  }
}
