

import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/gantDataModel.dart';



class MultiServerGanttChart extends StatelessWidget {
  List<Customer> customers=[];
  MultiServerGanttChart({required this.customers});

  @override
  Widget build(BuildContext context) {

    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
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
          var serviceTime = customer.serviceTime;

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
              server1CompletionTime += (serviceTime);
            } else {
              customer.server = 2;
              customer.waitingTime = server2CompletionTime - arrivalTime;
              server2CompletionTime += (serviceTime);
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
          serviceTime+=updatedArrivalTime;



          return Container(
            width: 60,
            margin: const EdgeInsets.all(2),
            color: (customer.server == 1) ? Colors.blue : Colors.teal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'startTime: $updatedArrivalTime',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    'endTime: $serviceTime',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
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