import 'package:flutter/material.dart';

class Customer {
  final int id;
  final int serviceTime;
  final int arrivalTime;
  int waitingTime;
  int server;

  Customer(this.serviceTime, this.arrivalTime, this.waitingTime, this.server, this.id);
}