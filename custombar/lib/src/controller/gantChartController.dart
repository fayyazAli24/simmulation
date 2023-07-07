import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../services/gantDataModel.dart';

class ChartController extends GetxController{
  final List<Customer> customers = [
    Customer(10, 0, 0, 0),
    Customer(20, 2, 0, 0),
    Customer(4, 4, 0, 0),
    Customer(8, 13, 0, 0),
    Customer(12, 16, 0, 0),
    Customer(3, 24, 0, 0),
  ].obs;


  RxMap<String, double> dataMapPoisson = {
    "0-20": 0.0,
    "20-40": 0.0068,
    "40-60": 0.6042,
    "60-80": 0.3860,
    "80-100": 0.0031,
    "100-120": 0.0,
  }.obs;

  RxMap<String, double> dataMap = {
    "60-70": 3.2,
    "70-80": 0.048389527,
    "80-90": 0.043254459,
    "90-100": 0.038664321,
    "100-110": 0.034571286,
    "110-120": 0.020893663,
  }.obs;



  List<int> barData = [35,46,31,33,41,33];

  List<double> barData2 = [0.3458,2.2987,1.6798,0.2589,3.2589,1.5897];


  List<double> barDataPoisson = [1.27895,0.42786,3.4789,2.78986,0.24789,0.789643];

  List<FlSpot> lineChartData =[
    FlSpot(70,11.8554),
    FlSpot(80,10.5973),
    FlSpot(90,9.4727),
    FlSpot(100,8.4675),
    FlSpot(110,7.5689),
    FlSpot(120,6.7657),
  ];

  List<FlSpot> lineChartDataPoisson =[
    FlSpot(20,0.0),
    FlSpot(40,1.481),
    FlSpot(60,132.312),
    FlSpot(80,84.535),
    FlSpot(100,0.672),
    FlSpot(120,0.0),
  ];

}