import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math';

import '../services/gantDataModel.dart';

class RandomResultScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxDouble mean = 0.0.obs;
  RxInt MainOptions = 0.obs;
  var server1Utilization=0.0.obs;
  var server2Utilization=0.0.obs;
  var standardDeviation =0.0.obs;
  var variance =0.0.obs;
  RxInt MGoptions = 0.obs;
  RxInt servers=0.obs;
  RxDouble meanService = 0.0.obs;
  RxList<double> probablityList = RxList<double>();
  RxList<int> interArrivalList = [0].obs;
  var lookupProbablity = [].obs;
  RxList<int> arrivalList = [0].obs;
  var serviceList = [0].obs;
  RxList<int> startTimeList = [0].obs;
  RxList<int> endTimeList = [0].obs;
  RxList<int> turnAroundTimeList = [0].obs;
  RxList<int> waitTimeList = [0].obs;
  RxList<int> responseTimeList = [0].obs;
  var upperLimit=0.obs;
  var lowerLimit = 0.obs;
  List<Customer> gantChartData=[];
  var intTime=0.0.obs;
  var arrTime=0.0.obs;
  var serTime =0.0.obs;
  var startTime =0.0.obs;
  var endTime = 0.0.obs;
  var TATtime=0.0.obs;
  var waitTime = 0.0.obs;
  var respTime = 0.0.obs;
  var customerNumber = 0.obs;
  RxBool isPriority= false.obs;
  var priorityList = [].obs;

  var Z = 0.0;
  var A =0.0;
  // var B = 1.obs;
  var M = 0.0;
  var C = 0.0;
  var a = 0.0;
  var b = 0.0;




  void calculateProbablityUsingPoisson() {
    var list = <double>[];
    var probablity = 0.0;
    for (int x = 0; x < customerNumber.value; x++) {
      probablity += (exp(-mean.value) * pow(mean.value, x)) / factorial(x);
      list.add(probablity);
      probablityList.add(probablity);
      lookupProbablity.add(probablity);
    }
  }


  void generatePriority(){
    Random random = Random();
    var priorities =[];
    for(int i=0; i<customerNumber.value; i++){
      var temp = random.nextInt(4);
      if(temp == 0){
        temp++;
      }
      priorities.add(temp);
    }
    priorityList.value = priorities;
  }

  void generatePriorityCorrect(){
    var list = [];
    var listR =[];
    var temp = [];
    var randomNumber = 0.0;
    for(int i=0;i<customerNumber.value ; i++){
      Z = (A * Z+C) % M;
      randomNumber = Z / M;
      list.add(Z);
      listR.add(randomNumber);
      var priority = ((b-a)*(randomNumber+a));
      if(int.parse(priority.toString().substring(2)) > 5) {
        temp.add(priority.ceil());
        priorityList.add(priority);
      }else if(int.parse(priority.toString().substring(2)) <= 5){
        temp.add(priority);
        priorityList.add(priority.floor());
      }
    }
    print(priorityList);
  }

  void calculateArrivalList() {
    List<int> list = [];
    var result;
    for (int i = 1; i < interArrivalList.length; i++) {
      // list[0]=0;
      if (i == 1) {
        result = interArrivalList[i];
        // print("result in if : " + list.toString());
        list.add(result);
        arrivalList.add(result);
      } else {
        result = interArrivalList[i] + interArrivalList[i - 1];
        list.add(result);
        arrivalList.add(result);
      }
    }
  }

  void serviceTimeCalculator() {
    Random random = Random();
    List<int> calculatedServiceTimeList = [];
    for (int i = 0; i < customerNumber.value; i++) {
      double randomNumber = random.nextDouble();
      while (randomNumber == 0 && randomNumber == 1) {
        randomNumber = random.nextDouble();
      }
      var estimatedNumber = (-mean.value * log(randomNumber));
      var newValue = estimatedNumber.ceil();
      calculatedServiceTimeList.add(newValue);
    }
    serviceList.value = calculatedServiceTimeList;
  }

  void calculateUpdatedArrivalTimes() {
    List<int> startTime = [];
    int serverCompletionTime = 0;

    for (int i = 0; i < customerNumber.value; i++) {
      final arrivalTime = arrivalList[i];
      final serviceTime = serviceList[i];
      // Calculate the updated arrival time before incrementing
      final updatedArrivalTime = (serverCompletionTime > arrivalTime)
          ? serverCompletionTime
          : arrivalTime;
      // Increment the arrival time in the list
      startTime.add(updatedArrivalTime);
      // Update the server completion time
      serverCompletionTime = updatedArrivalTime + serviceTime + 1;

    }
    startTime.add(serverCompletionTime);
    startTimeList.value = startTime;
    endTimeList.value = startTime;
  }

  void calculateTurnAroundTimeforSingle() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < customerNumber.value; i++) {
      result = endTimeList[i+1] - arrivalList[i];
      tempList.add(result);
    }
    turnAroundTimeList.value = tempList;
  }

  void calculateTurnAroundTimeforDouble() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < customerNumber.value; i++) {
      result = endTimeList[i] - arrivalList[i];
      tempList.add(result);
    }
    turnAroundTimeList.value = tempList;
  }

  void calculateWaitTime() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < customerNumber.value; i++) {
      result = turnAroundTimeList[i] - serviceList[i];
      tempList.add(result);
    }
    waitTimeList.value = tempList;
  }

  void calculateResponseTime() {
    List<int> tempList = [];
    for (int i = 0; i < customerNumber.value; i++) {
      var result = startTimeList[i] - arrivalList[i];
      tempList.add(result);
    }
    responseTimeList.value = tempList;
  }

  int factorial(int n) {
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  void calculateStartAndEndTime (){
    List<int> prevEnd = [0, 0];
    List<int> startTimeArr = List.filled(customerNumber.value, 0);
    List<int> endTimeArr = List.filled(customerNumber.value, 0);

    // Loop through each task
    for (int j = 0; j < customerNumber.value; j++) {
      int minValue = prevEnd.reduce((a, b) => a < b ? a : b);
      int index = prevEnd.indexOf(minValue);

      // If the arrival time is less than the minimum previous end time
      if (arrivalList[j] < minValue) {
        startTimeArr[j] = minValue;
        endTimeArr[j] = minValue + serviceList[j];
        prevEnd[index] = minValue + serviceList[j];
      } else {
        // Find a suitable slot for the task
        for (int i = 0; i < 2; i++) {
          if (arrivalList[j] >= prevEnd[i]) {
            endTimeArr[j] = arrivalList[j] + serviceList[j];
            startTimeArr[j] = arrivalList[j];
            prevEnd[i] = endTimeArr[j];
            break;
          }
        }
        startTimeList.value = startTimeArr;
        endTimeList.value = endTimeArr;
      }
    }
  }

  void initializeGantChart(){
    List<Customer> list=[];
    for (int i=0;i<customerNumber.value;i++){
      list.add(Customer( serviceList[i],arrivalList[i], 0, 0,i+1));
    }
    gantChartData = list;
    update();
}

  void calculateUniformserviceTime(){
    List<int> list =[];
    var number;
    Random random = Random();
    for(int i=0;i<customerNumber.value;i++){
      number = upperLimit.value + random.nextInt(upperLimit.value-lowerLimit.value);
      list.add(number);
    }
    serviceList.value = list;
    update();
}

  void normalServiceTime(){
    var random=Random();
    List<int> randomNumbers=[];
    for(int i=0;i<customerNumber.value;i++){
      var randomNumber = -1.0;
      while(randomNumber<0){
        var u1 = 1.0 - random.nextDouble();
        var u2 = 1.0 - random.nextDouble();
        var z = sqrt(-2.0 * log(u1)) * cos( 2.0 * pi * u2); // box muller transform
        randomNumber = mean.value + z * standardDeviation.value;

      }
      randomNumbers.add(randomNumber.ceil());
    }
    serviceList.value = randomNumbers;
}

  void calculateGammaServiceTime() {
    var shape = pow(meanService.value, 2) / variance.value;
    var scale = variance / meanService.value;

    var d = shape - 1 / 3;
    var c = 1 / sqrt(9 * d);

    List<int> randomNumberList = [];

    for (var i = 0; i < 10; i++) {
      var Z, U, V, X;
      do {
        U = Random().nextDouble();
        V = 1 + c * (Random().nextDouble() - 0.5);
        V = pow(V, 3);
        Z = U - c;
        Z = Z / sqrt(V);
        X = d * Z;
      } while (X <= -1 || log(U) >= (X * (1 - X) + d * log(X)));

      var V1 = Random().nextDouble();
      var V2 = Random().nextDouble();
      var W = exp((X - 1) / d);
      var number = scale * X;

      if (number > 0) {
        if (X > 0) {
          if (V1 <= W) {
            randomNumberList.add(number.ceil().toInt());
          }
        } else {
          if (V1 <= 1 - W) {
            randomNumberList.add(number.ceil().toInt());
          }
        }

        if (V2 <= exp(-0.5 * X)) {
          randomNumberList.add(number.ceil().toInt());
        }
      }
    }

    serviceList.value = randomNumberList;
  }

  void interArrival(){
    Random random = Random();
    var lookup=[];
    var number ;
    List<int> intArr=[];
    for(int i=0;i<customerNumber.value;i++){
      if(i==0){
        lookup.add(0);
      }else{
        lookup.add(probablityList[i-1]);
      }
    }

    lookupProbablity.value = lookup;


    for(int i=0;i<customerNumber.value;i++){
      number = random.nextDouble();
      for(int j=1;j<customerNumber.value;j++){
        if(number > lookup[j] && number < probablityList[j]) {
          intArr.add(j);
          print(number);
        }
        }
      }
    interArrivalList.value = intArr;
    interArrivalList.insert(0, 0);

  }

  void calculateAverages() {
    int averageIntTime=0 ;
    int averageArrTime = 0;
    int averageServiceTime = 0;
    int averageTATtime = 0;
    int averageStartTime = 0;
    int averageEndTime = 0;
    int averageWaitTime = 0;
    int averageRespTime = 0;
    // Check the length of the lists or use a fixed size if applicable


    for (int i = 0; i < customerNumber.value; i++) {
      averageIntTime += (interArrivalList[i]);
      averageArrTime += arrivalList[i];
      averageServiceTime += serviceList[i];
      averageStartTime += startTimeList[i];
      averageEndTime += endTimeList[i+1];
      averageWaitTime += waitTimeList[i];
      averageRespTime += responseTimeList[i];
      averageTATtime += turnAroundTimeList[i];
    }

    // Calculate the averages based on the actual number of elements
    var intTime1 = averageIntTime / customerNumber.value;
    var arrTime2 = averageArrTime / customerNumber.value;
    var serTime3 = averageServiceTime / customerNumber.value;
    var tatTime4 = averageTATtime / customerNumber.value;
    var startTime5 = averageStartTime / customerNumber.value;
    var endTime6 = averageEndTime / customerNumber.value;
    var waitTime7 = averageWaitTime / customerNumber.value;
    var respTime8 = averageRespTime / customerNumber.value;

    // Assign the calculated averages to the appropriate variables
    intTime.value = intTime1;
    arrTime.value = arrTime2;
    serTime.value = serTime3;
    TATtime.value = tatTime4;
    startTime.value = startTime5;
    endTime.value = endTime6;
    waitTime.value = waitTime7;
    respTime.value = respTime8;
  }

  Map<String,double> calculatePieChart(){
     Map <String, double> dataMap = {
      "avg TAT": TATtime.value,
      "avg ST":   startTime.value,
      "avg WT": waitTime.value,
      "avg RT": respTime.value,
      "avg AT": arrTime.value,
      "avg ET": endTime.value,
      "avg SET": serTime.value
    };
     return dataMap;

  }

  List<FlSpot> startList(){
    List<FlSpot> waitTimeData = [];
    var spot;
    for(int i=0;i<customerNumber.value;i++){
      spot = FlSpot(i+1,startTimeList[i] as double );
      waitTimeData.add(spot);
    }
    return waitTimeData;
  }

  List<FlSpot> endList(){
    List<FlSpot> waitTimeData = [];
    var spot;
    for(int i=0;i<customerNumber.value;i++){
      spot = FlSpot(i+1,endTimeList[i] as double );
      waitTimeData.add(spot);
    }
    return waitTimeData;
  }

}
