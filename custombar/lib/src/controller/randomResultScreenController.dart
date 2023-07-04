import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
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
  RxList<double> lookupProbablity = [0.0].obs;
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


  void calculateProbablityUsingPoisson() {
    var list = <double>[];
    var probablity = 0.0;
    for (int x = 0; x < 10; x++) {
      probablity += (exp(-mean.value) * pow(mean.value, x)) / factorial(x);
      list.add(probablity);
    }
    probablityList.value = list;
    lookupProbablity.value = list;
  }

  void interArrivalTimeCalculator() {
    List<int> list = [];
    var random = Random();
    for (int i = 0; i < 10; i++) {
      var randomNumbers = random.nextInt(5) + 1;
      list.add(randomNumbers);
    }
    interArrivalList.value = list;
    interArrivalList.insert(0, 0);
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
      } else {
        result = interArrivalList[i] + list[i - 2];
        list.add(result);
        // print("result in else : " + list.toString());
      }
    }
    arrivalList.value = list;
    arrivalList.insert(0, 0);
  }

  void serviceTimeCalculator() {
    Random random = Random();
    List<int> calculatedServiceTimeList = [];
    for (int i = 0; i < 10; i++) {
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

    for (int i = 0; i < 10; i++) {
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
      // print(
      //     "server completion time :${serverCompletionTime}updated ${updatedArrivalTime}service $serviceTime");
    }
    startTime.add(serverCompletionTime);
    startTimeList.value = startTime;
    endTimeList.value = startTime;
  }

  void calculateTurnAroundTimeforSingle() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < 10; i++) {
      result = endTimeList[i+1] - arrivalList[i];
      tempList.add(result);
    }
    turnAroundTimeList.value = tempList;
  }

  void calculateTurnAroundTimeforDouble() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < 10; i++) {
      result = endTimeList[i] - arrivalList[i];
      tempList.add(result);
    }
    turnAroundTimeList.value = tempList;
  }

  void calculateWaitTime() {
    List<int> tempList = [];
    var result = 0;
    for (int i = 0; i < 10; i++) {
      result = turnAroundTimeList[i] - serviceList[i];
      tempList.add(result);
    }
    waitTimeList.value = tempList;
  }

  void calculateResponseTime() {
    List<int> tempList = [];
    for (int i = 0; i < 10; i++) {
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
    List<int> startTimeArr = List.filled(11, 0);
    List<int> endTimeArr = List.filled(11, 0);

    // Loop through each task
    for (int j = 0; j < 10; j++) {
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
    for (int i=0;i<10;i++){
      list.add(Customer( serviceList[i],arrivalList[i], 0, 0));
    }
    gantChartData = list;
    update();
}

  void calculateUniformserviceTime(){
    List<int> list =[];
    var number;
    Random random = Random();
    for(int i=0;i<10;i++){
      number = upperLimit.value + random.nextInt(upperLimit.value-lowerLimit.value);
      list.add(number);
    }
    serviceList.value = list;
    update();
}

  void normalServiceTime(){
    var random=Random();
    List<int> randomNumbers=[];
    for(int i=0;i<11;i++){
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
    for(int i=0;i<10;i++){
      if(i==0){
        lookup.add(0);
      }else{
        lookup.add(probablityList[i-1]);
      }
    }
    print("cp lookup is "+ lookup.toString());

    for(int i=0;i<10;i++){
      number = random.nextDouble();
      for(int j=1;j<10;j++){
        if(number> lookup[j] && number < probablityList[j]) {
          intArr.add(j);
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


    for (int i = 0; i < 10; i++) {
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
    var intTime1 = averageIntTime / 10;
    var arrTime2 = averageArrTime / 10;
    var serTime3 = averageServiceTime / 10;
    var tatTime4 = averageTATtime / 10;
    var startTime5 = averageStartTime / 10;
    var endTime6 = averageEndTime / 10;
    var waitTime7 = averageWaitTime / 10;
    var respTime8 = averageRespTime / 10;

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
    for(int i=0;i<10;i++){
      spot = FlSpot(i+1,startTimeList[i] as double );
      waitTimeData.add(spot);
    }
    return waitTimeData;
  }
  List<FlSpot> endList(){
    List<FlSpot> waitTimeData = [];
    var spot;
    for(int i=0;i<10;i++){
      spot = FlSpot(i+1,endTimeList[i] as double );
      waitTimeData.add(spot);
    }
    return waitTimeData;
  }

}
