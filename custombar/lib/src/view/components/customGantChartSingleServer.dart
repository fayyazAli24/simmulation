import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/gantDataModel.dart';

class SingleServerGanttChart extends StatelessWidget {
  List<Customer> customers;
  SingleServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {
    int serverCompletionTime = 0;
    RandomResultScreenController controller = Get.put(RandomResultScreenController());

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          final arrivalTime = customer.arrivalTime;
          final serviceTime = customer.serviceTime;
          var priority = controller.priorityList[index];

          // Assign customer to the available server
          if (serverCompletionTime <= arrivalTime) {
            customer.server = 1;
            customer.waitingTime = 0;
            serverCompletionTime = arrivalTime + serviceTime;
          } else {
            // Server is busy, calculate waiting time and update completion time
            customer.server = 1;
            customer.waitingTime = serverCompletionTime - arrivalTime;
            serverCompletionTime += (serviceTime);
          }

          final updatedArrivalTime = arrivalTime + customer.waitingTime;
          final startOffset = (serverCompletionTime < updatedArrivalTime)
              ? updatedArrivalTime
              : serverCompletionTime;

          final endOffset = startOffset + serviceTime;

          return Container(
            width: 60,
            margin: EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.blue,),
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
                    child: Center(child: Text(customers[index].id.toString())),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Svc: $serverCompletionTime',
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
