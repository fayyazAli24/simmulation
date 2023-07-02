import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/components/button.dart';
import 'package:custombar/src/view/screens/MGSoptions.dart';
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
                Get.defaultDialog(
                    title: 'M/M/Servers(s)',
                    content: DialogBoxContainer(
                      controller1: controllerlamda,
                      controller2: controllermiu,
                      controller3: controllerServers,
                      tap: () {
                        randomResultScreenController.mean.value =
                            double.parse(controllerlamda.text.toString());
                        randomResultScreenController.meanService.value =
                            double.parse(controllermiu.text.toString());
                        randomResultScreenController.servers.value =
                            int.tryParse(controllerServers.text.toString())!;
                        randomResultScreenController
                            .calculateProbablityUsingPoisson();

                        randomResultScreenController
                            .interArrivalTimeCalculator();
                        randomResultScreenController.calculateArrivalList();
                        randomResultScreenController.serviceTimeCalculator();
                        if (randomResultScreenController.servers.value == 1) {
                          randomResultScreenController
                              .calculateUpdatedArrivalTimes();
                          randomResultScreenController
                              .calculateTurnAroundTimeforSingle();
                          randomResultScreenController.calculateWaitTime();
                          randomResultScreenController.calculateResponseTime();
                          randomResultScreenController.initializeGantChart();
                        }
                        if (randomResultScreenController.servers.value == 2) {
                          randomResultScreenController
                              .calculateStartAndEndTime();
                          randomResultScreenController
                              .calculateTurnAroundTimeforDouble();
                          randomResultScreenController.calculateWaitTime();
                          randomResultScreenController.calculateResponseTime();
                          randomResultScreenController.initializeGantChart();
                        }
                        print(randomResultScreenController.endTimeList);
                        print(randomResultScreenController.arrivalList);
                        Get.to(const RandomDataScreen());
                      },
                    ));
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: (){
                Get.to(MGSoptions());
              },
                child: CommonOptionButton(buttonName: "M/G/S")),
            SizedBox(
              height: 2.h,
            ),
            CommonOptionButton(buttonName: "G/G/S"),
          ],
        ),
      ),
    );
  }
}
