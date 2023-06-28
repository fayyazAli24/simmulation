import 'package:get/get.dart';
import 'dart:math';



class RandomResultScreenController extends GetxController{
  @override
  void onInit() {
    calculateProbablityUsingPoisson();
    print("the mean value is "+mean.value.toString());
    super.onInit();
  }
  var mean = 0.0.obs;
  var probablityList = [].obs;
  var interArrivalList = [0,1,2,3,4,5,6,7,8,9].obs;
  var arrivalList = [1,2,3,4,5,6,7,8,9,9].obs;
  var serviceList = [1,2,3,4,5,6,7,8,9,9].obs;

  void calculateProbablityUsingPoisson(){
    var list = [];
    var probablity = 0.0;
    for (int x = 0;x<10;x++) {
       probablity += (exp(-mean.value) * pow(mean.value, x)) / factorial(x);
      list.add(probablity);
    }
    probablityList.value = list;
  }


  int factorial(int n) {
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }


}