import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/components/button.dart';
import 'package:custombar/src/view/screens/MGSoptions.dart';
import 'package:custombar/src/view/screens/MMOptionScreen.dart';
import 'package:custombar/src/view/screens/randomDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/dialogBoxContainer.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerlamda = TextEditingController();
    TextEditingController controllermiu = TextEditingController();
    TextEditingController controllerServers = TextEditingController();
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: CommonOptionButton(buttonName: "M/M/S"),
              onTap: () {
                randomResultScreenController.MainOptions.value = 1;
                Get.to(const MMOptionScreen());
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
                onTap: () {
                  randomResultScreenController.MainOptions.value = 2;
                  Get.to(MGSoptions());
                },
                child: CommonOptionButton(buttonName: "M/G/S")),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
