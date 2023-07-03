import 'dart:async';

import 'package:custombar/src/cores/routes/appRoutes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController{

  splashMethod() {
    Timer(Duration(seconds: 6), () {
      Get.offAndToNamed(AppRoutes.homeScreen);
    });
  }
  @override
  void onInit() {
splashMethod();
super.onInit();
  }
}