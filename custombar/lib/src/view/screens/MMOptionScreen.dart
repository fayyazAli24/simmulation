import 'package:custombar/src/view/components/priorityBox.dart';
import 'package:custombar/src/view/screens/randomDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/randomResultScreenController.dart';
import '../components/MGSdialogContainer.dart';
import '../components/button.dart';
import '../components/dialogBoxContainer.dart';

class MMOptionScreen extends StatelessWidget {
  const MMOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerlamda = TextEditingController();
    TextEditingController controllermiu = TextEditingController();
    TextEditingController customersController = TextEditingController();
    TextEditingController controllerServers = TextEditingController();
    TextEditingController controllerA = TextEditingController();
    TextEditingController controllerM = TextEditingController();
    TextEditingController controllerZ = TextEditingController();
    TextEditingController controllerC = TextEditingController();
    TextEditingController controllera = TextEditingController();
    TextEditingController controllerb = TextEditingController();
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
                onTap: () {

                  Get.defaultDialog(
                      title: 'M/M/Servers(s)',
                      content: DialogBoxContainer(
                        controller1: controllerlamda,
                        controller2: controllermiu,
                        controller3: controllerServers,
                        controller4: customersController,
                        tap: () {
                          randomResultScreenController.isPriority.value = false;
                          randomResultScreenController.customerNumber.value = int.tryParse(customersController.text.toString())!;
                          randomResultScreenController.mean.value =
                              double.parse(controllerlamda.text.toString());
                          randomResultScreenController.meanService.value =
                              double.parse(controllermiu.text.toString());
                          randomResultScreenController.servers.value =
                          int.tryParse(controllerServers.text.toString())!;
                          randomResultScreenController
                              .calculateProbablityUsingPoisson();
                          randomResultScreenController.generatePriority();

                          randomResultScreenController
                              .interArrival();


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
                          randomResultScreenController.calculateAverages();

                          Get.to(const RandomDataScreen());
                        },
                      ));
                },
                child: CommonOptionButton(buttonName: "Normal ")),
            SizedBox(height: 2.h,),
            InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: 'M/M/Servers(s)',
                      content: PriorityBox(
                        controllerArrival: controllerlamda,
                        controllerService: controllermiu,
                        controllerServers: controllerServers,
                        controllerCustomers: customersController,
                        controllerA: controllerA,
                        controllerM: controllerM,
                        controllerZ: controllerZ,
                        controllerc: controllerC,
                        controllera: controllera,
                        controllerb: controllerb,
                        tap: () {
                          randomResultScreenController.isPriority.value = true;
                          randomResultScreenController.A = double.parse(controllerA.text);
                          randomResultScreenController.Z = double.parse(controllerZ.text);
                          randomResultScreenController.M = double.parse(controllerM.text);
                          randomResultScreenController.C = double.parse(controllerC.text);
                          randomResultScreenController.a = double.parse(controllera.text);
                          randomResultScreenController.b= double.parse(controllerb.text);
                          randomResultScreenController.customerNumber.value = int.tryParse(customersController.text.toString())!;

                          print("setting values are");
                          print(controllerlamda.text);
                          print(controllermiu.text);
                          print(controllerServers.text);
                          print(controllerA.text);
                          print(controllerM.text);
                          print(controllerZ.text);
                          print(controllerC.text);
                          print(controllera.text);
                          print(controllerb.text);
                          print("controller values are");
                          print(randomResultScreenController.A);
                          print(randomResultScreenController.M);
                          print(randomResultScreenController.Z);
                          print(randomResultScreenController.C);
                          print(randomResultScreenController.b);
                          print(randomResultScreenController.a);



                          randomResultScreenController.mean.value =
                              double.parse(controllerlamda.text.toString());
                          randomResultScreenController.meanService.value =
                              double.parse(controllermiu.text.toString());
                          randomResultScreenController.servers.value =
                          int.tryParse(controllerServers.text.toString())!;


                          randomResultScreenController.generatePriorityCorrect();
                          print(randomResultScreenController.priorityList);
                          randomResultScreenController.calculateProbablityUsingPoisson();
                          randomResultScreenController.interArrival();
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
                          // if (randomResultScreenController.servers.value == 2) {
                          //   randomResultScreenController
                          //       .calculateStartAndEndTime();
                          //   randomResultScreenController
                          //       .calculateTurnAroundTimeforDouble();
                          //   randomResultScreenController.calculateWaitTime();
                          //   randomResultScreenController.calculateResponseTime();
                          //   randomResultScreenController.initializeGantChart();
                          // }
                          // randomResultScreenController.calculateAverages();

                          Get.to(const RandomDataScreen());
                        },
                      ));
                },
                child: CommonOptionButton(buttonName: "Priority")


            ),
            SizedBox(height: 2.h,),

          ],
        ),
      ),
    );
  }
}
