import 'package:get/get.dart';
import 'dart:math';

import '../services/gantDataModel.dart';

class RandomResultScreenController extends GetxController {
  @override
  void onInit() {
    calculateProbablityUsingPoisson();
    interArrivalTimeCalculator();
    calculateArrivalList();
    serviceTimeCalculator();
    calculateUpdatedArrivalTimes();
    calculateTurnAroundTime();
    calculateWaitTime();
    calculateResponseTime();
    super.onInit();
  }

  RxDouble mean = 0.0.obs;
  RxDouble meanService = 0.0.obs;
  RxList<double> probablityList = RxList<double>();
  var interArrivalList = [].obs;
  RxList<double> lookupProbablity = [0.0].obs;
  var arrivalList = [].obs;
  var serviceList = [].obs;
  var startTimeList = [].obs;
  var endTimeList = [].obs;
  var turnAroundTimeList = [].obs;
  var waitTimeList = [].obs;
  var responseTimeList = [].obs;
  dynamic gantChartData=[].obs;

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
    var list = [];
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
    var list = [];
    var random = Random();
    for (int i = 0; i < 10; i++) {
      var randomNumbers = random.nextInt(9) + 1;
      list.add(randomNumbers);
    }
    serviceList.value = list;
    // Random random = Random();
    // var calculatedServiceTimeList = [];
    // for (int i = 0; i < 10; i++) {
    //   double randomNumber = random.nextDouble();
    //   while (randomNumber == 0 || randomNumber == 1) {
    //     randomNumber = random.nextDouble();
    //   }
    //   var estimatedNumber = (randomNumber * meanService.value).ceil();
    //   calculatedServiceTimeList.add(estimatedNumber);
    // }
    // serviceList.value = calculatedServiceTimeList;
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
      print(
          "server completion time :${serverCompletionTime}updated ${updatedArrivalTime}service $serviceTime");
    }
    startTime.add(serverCompletionTime);
    startTimeList.value = startTime;
    endTimeList.value = startTime;
  }

  void calculateTurnAroundTime() {
    var tempList = [];
    var result = 0;
    for (int i = 0; i < 10; i++) {
      result = endTimeList[i + 1] - arrivalList[i];
      tempList.add(result);
    }
    turnAroundTimeList.value = tempList;
  }

  void calculateWaitTime() {
    var tempList = [];
    var result = 0;
    for (int i = 0; i < 10; i++) {
      result = turnAroundTimeList[i] - serviceList[i];
      tempList.add(result);
    }
    waitTimeList.value = tempList;
  }

  void calculateResponseTime() {
    var tempList = [];
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

  // void calculateStartAndEndTimes() {
  //   var prevEnd = [0, 0];
  //   var startTimeArr = [];
  //   var endTimeArr = [];
  //   int end_time = 0;
  //
  //   for (int j = 0; j < 10; j++) {
  //     int min = prevEnd[0];
  //     int index = 0;
  //
  //     // Find the minimum value in prevEnd
  //     for (int i = 0; i < 2; i++) {
  //       if (prevEnd[i] < min) {
  //         min = prevEnd[i];
  //       }
  //     }
  //     // Find the index of the minimum value in prevEnd
  //     for (int i = 0; i < 2; i++) {
  //       if (prevEnd[i] == min) {
  //         index = i;
  //         break;
  //       }
  //     }
  //     if (arrivalList[j] < min) {
  //       startTimeArr[j] = min;
  //       endTimeArr[j] = min + serviceList[j];
  //       prevEnd[index] = min + int.parse(serviceList[j]);
  //     } else {
  //       for (int i = 0; i < 2; i++) {
  //         if (arrivalList[j] >= prevEnd[i]) {
  //           end_time = arrivalList[j] + serviceList[j];
  //           startTimeArr[j] = arrivalList[j];
  //           endTimeArr[j] = end_time;
  //           prevEnd[i] = end_time;
  //           break;
  //         }
  //       }
  //     }
  //   }
  // }

void initializeGantChart(){
    var list=[];
    for (int i=0;i<10;i++){
      list.add(Customer( serviceList[i],arrivalList[i], 0, 0));
      print(list);
    }
    gantChartData.value = list;
    update();
}



}
