import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/gantDataModel.dart';

class SingleServerGanttChart extends StatelessWidget {
  dynamic customers;

  SingleServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {
    int serverCompletionTime = 0;

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
          if (serverCompletionTime <= arrivalTime) {
            customer.server = 1;
            customer.waitingTime = 0;
            serverCompletionTime = arrivalTime + serviceTime;
          } else {
            // Server is busy, calculate waiting time and update completion time
            customer.server = 1;
            customer.waitingTime = serverCompletionTime - arrivalTime;
            serverCompletionTime += int.parse(serviceTime);
          }

          final updatedArrivalTime = arrivalTime + customer.waitingTime;
          final startOffset = (serverCompletionTime < updatedArrivalTime)
              ? updatedArrivalTime
              : serverCompletionTime;

          final endOffset = startOffset + serviceTime;

          return Container(
            width: serviceTime.toDouble() * 40,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.black,
                width: 5
              )
            ),
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
