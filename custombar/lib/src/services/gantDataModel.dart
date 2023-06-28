import 'package:flutter/material.dart';

class Customer {
  final int serviceTime;
  final int arrivalTime;
  int waitingTime;
  int server;

  Customer(this.serviceTime, this.arrivalTime, this.waitingTime, this.server);
}