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
                randomResultScreenController.MainOptions.value =1;
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
                        print("the arrival mean is "+randomResultScreenController.mean.value.toString());
                        print("the service mean is "+randomResultScreenController.meanService.value.toString());
                        print("the server is "+randomResultScreenController.servers.value.toString());
                        print("poisson list is "+randomResultScreenController.probablityList.toString());
                        randomResultScreenController
                            .interArrival();
                        print("interarrival list is "+randomResultScreenController.interArrivalList.toString());

                        randomResultScreenController.calculateArrivalList();
                        print("arrival list is "+randomResultScreenController.arrivalList.toString());
                        randomResultScreenController.serviceTimeCalculator();
                        print("service list is "+randomResultScreenController.serviceList.toString());
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
                        randomResultScreenController.calculateAverages();
                        // print(randomResultScreenController.intTime);
                        // print(randomResultScreenController.arrTime);
                        // print(randomResultScreenController.serTime);
                        // print(randomResultScreenController.startTime);
                        // print(randomResultScreenController.endTime);
                        // print(randomResultScreenController.TATtime);
                        // print(randomResultScreenController.respTime);
                        // print(randomResultScreenController.waitTime);
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
                randomResultScreenController.MainOptions.value =2;
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
