

import 'package:flutter/material.dart';

import '../../services/gantDataModel.dart';

// class GanttChart extends StatelessWidget {
//   final List<Customer> customers;
//
//   GanttChart({required this.customers});
//
//   @override
//   Widget build(BuildContext context) {
//     int previousCompletionTimeServer1 = 0;
//     int previousCompletionTimeServer2 = 0;
//
//     return Container(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: customers.length,
//         itemBuilder: (context, index) {
//           final customer = customers[index];
//           final arrivalTime = customer.arrivalTime;
//           final serviceTime = customer.serviceTime;
//
//           customer.waitingTime = (customer.server == 1)
//               ? (previousCompletionTimeServer1 > arrivalTime)
//               ? previousCompletionTimeServer1 - arrivalTime
//               : 0
//               : (previousCompletionTimeServer2 > arrivalTime)
//               ? previousCompletionTimeServer2 - arrivalTime
//               : 0;
//
//           final updatedArrivalTime = arrivalTime + customer.waitingTime;
//           final startOffset = (customer.server == 1)
//               ? (previousCompletionTimeServer1 < updatedArrivalTime)
//               ? updatedArrivalTime
//               : previousCompletionTimeServer1
//               : (previousCompletionTimeServer2 < updatedArrivalTime)
//               ? updatedArrivalTime
//               : previousCompletionTimeServer2;
//
//           final endOffset = startOffset + serviceTime;
//
//           if (customer.server == 1) {
//             previousCompletionTimeServer1 = endOffset;
//           } else {
//             previousCompletionTimeServer2 = endOffset;
//           }
//
//           return Container(
//             width: serviceTime.toDouble() * 40,
//             margin: EdgeInsets.all(2),
//             color: (customer.server == 1) ? Colors.blue : Colors.green,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(2),
//                   child: Text(
//                     'Arr: $updatedArrivalTime',
//                     style: TextStyle(color: Colors.white, fontSize: 10),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 2),
//                     color: Colors.white,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(2),
//                   child: Text(
//                     'Svc: $serviceTime',
//                     style: TextStyle(color: Colors.white, fontSize: 10),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class MultiServerGanttChart extends StatelessWidget {
  final List<Customer> customers;

  MultiServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {
    int server1CompletionTime = 0;
    int server2CompletionTime = 0;

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          final arrivalTime = customer.arrivalTime;
          final serviceTime = customer.serviceTime;

          // Assign customer to the available server
          if (server1CompletionTime <= arrivalTime) {
            customer.server = 1;
            customer.waitingTime = 0;
            server1CompletionTime = arrivalTime + serviceTime;
          } else if (server2CompletionTime <= arrivalTime) {
            customer.server = 2;
            customer.waitingTime = 0;
            server2CompletionTime = arrivalTime + serviceTime;
          } else {
            // Both servers are busy, assign to the server with the earliest completion time
            if (server1CompletionTime <= server2CompletionTime) {
              customer.server = 1;
              customer.waitingTime = server1CompletionTime - arrivalTime;
              server1CompletionTime += serviceTime;
            } else {
              customer.server = 2;
              customer.waitingTime = server2CompletionTime - arrivalTime;
              server2CompletionTime += serviceTime;
            }
          }

          final updatedArrivalTime = arrivalTime + customer.waitingTime;
          final startOffset = (customer.server == 1)
              ? (server1CompletionTime < updatedArrivalTime)
              ? updatedArrivalTime
              : server1CompletionTime
              : (server2CompletionTime < updatedArrivalTime)
              ? updatedArrivalTime
              : server2CompletionTime;

          final endOffset = startOffset + serviceTime;

          return Container(
            width: serviceTime.toDouble() * 40,
            margin: EdgeInsets.all(2),
            color: (customer.server == 1) ? Colors.blue : Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Arr: $updatedArrivalTime',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Svc: $serviceTime',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}