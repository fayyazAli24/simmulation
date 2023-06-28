import 'package:get/get.dart';

import '../services/gantDataModel.dart';

class ChartController extends GetxController{
  final List<Customer> customers = [
    Customer(5, 0, 0, 0),
    Customer(10, 2, 0, 0),
    Customer(8, 4, 0, 0),
    Customer(5, 10, 0, 0),
  ].obs;


  RxMap<String, double> dataMap = {
    "avg TAT": 5.4,
    "avg ST": 2.2,
    "avg WT": 4.8,
    "avg RT": 1.2,
  }.obs;

  var barData =[10, 21, 80, 40, 45].obs;

}