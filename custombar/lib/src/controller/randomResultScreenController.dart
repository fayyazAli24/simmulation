import 'package:get/get.dart';
import 'dart:math';

import '../services/gantDataModel.dart';

class RandomResultScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxDouble mean = 0.0.obs;
  RxInt servers=0.obs;
  RxDouble meanService = 0.0.obs;
  RxList<double> probablityList = RxList<double>();
  var interArrivalList = [].obs;
  RxList<double> lookupProbablity = [0.0].obs;
  RxList<int> arrivalList = [0].obs;
  RxList<int> serviceList = [0].obs;
  RxList<int> startTimeList = [0].obs;
  RxList<int> endTimeList = [0].obs;
  RxList<int> turnAroundTimeList = [0].obs;
  RxList<int> waitTimeList = [0].obs;
  RxList<int> responseTimeList = [0].obs;
  var upperLimit=0.obs;
  var lowerLimit = 0.obs;
  List<Customer> gantChartData=[];

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
    var list = [];
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
    // Print the arrival and service times
    print("ARR , SER");
    print("");
    print("");
    for (int i = 0; i < 10; i++) {
      print("${arrivalList[i]} , ${serviceList[i]}");
    }
    print("");
    print("");

    // Print the start and end times
    print("STA , END");
    for (int i = 0; i < 10; i++) {
      print("${startTimeArr[i]} , ${endTimeArr[i]}");
    }
  }


void initializeGantChart(){
    List<Customer> list=[];
    for (int i=0;i<10;i++){
      list.add(Customer( serviceList[i],arrivalList[i], 0, 0));
      print(list);
    }
    gantChartData = list;
    update();
}

void calculateMGserviceTime(){
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

}
