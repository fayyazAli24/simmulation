

import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/components/MGSdialogContainer.dart';
import 'package:custombar/src/view/components/MGSdialogNormal.dart';
import 'package:custombar/src/view/components/button.dart';
import 'package:custombar/src/view/screens/MGSscreen.dart';
import 'package:custombar/src/view/screens/randomDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MGSoptions extends StatelessWidget {
  const MGSoptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerLambda = TextEditingController();
    TextEditingController controllerServiceMean = TextEditingController();
    TextEditingController upper = TextEditingController();
    TextEditingController lower = TextEditingController();
    TextEditingController server = TextEditingController();
    TextEditingController standardDeviation = TextEditingController();
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Choose the service time distribution",style: TextStyle(color: Colors.white,fontSize: 14.sp),),
            SizedBox(height: 1.h,),
            InkWell(
              onTap: (){
                randomResultScreenController.MGoptions.value = 1;
                print("the select MG OPTION Is :"+randomResultScreenController.MGoptions.value.toString());
               Get.defaultDialog(
                 title: "M/G/S",
                 content: MGSdefaultDialogUniform(
                   controller1: controllerLambda, controller2: upper, controller3: lower, controller4: server,
                   tap: (){
                   randomResultScreenController.mean.value =
                       double.parse(controllerLambda.text.toString());
                   randomResultScreenController.upperLimit.value =
                       int.parse(upper.text.toString());
                   randomResultScreenController.lowerLimit.value = int.parse(lower.text.toString());
                   randomResultScreenController.servers.value =
                   int.tryParse(server.text.toString())!;
                   randomResultScreenController
                       .calculateProbablityUsingPoisson();
                   randomResultScreenController
                       .interArrival();
                   randomResultScreenController.calculateArrivalList();
                   randomResultScreenController.calculateUniformserviceTime();
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
                     randomResultScreenController.calculateStartAndEndTime();
                     randomResultScreenController
                         .calculateTurnAroundTimeforDouble();
                     randomResultScreenController.calculateWaitTime();
                     randomResultScreenController.calculateResponseTime();
                     randomResultScreenController.initializeGantChart();
                   }
                   randomResultScreenController.calculateAverages();
                   Get.to(const RandomDataScreen());
                 },
                 )
               );
              },
                child: CommonOptionButton(buttonName: "Uniform")),
            SizedBox(height: 2.h,),
            InkWell(
              onTap: (){
                randomResultScreenController.MGoptions.value = 2;
                Get.defaultDialog(
                  title: "M/G/S",
                  content: MGSDialogNormal( controller1: controllerLambda, controller2: controllerServiceMean, controller3: standardDeviation, controller4: server,tap: (){
                    randomResultScreenController.mean.value = double.parse(controllerLambda.text.toString());
                    randomResultScreenController.meanService.value= double.parse(controllerServiceMean.text.toString());
                    randomResultScreenController.standardDeviation.value = double.parse(standardDeviation.text.toString());
                    randomResultScreenController.servers.value = int.parse(server.text.toString());
                    randomResultScreenController
                        .calculateProbablityUsingPoisson();
                    randomResultScreenController
                        .interArrival();
                    randomResultScreenController.calculateArrivalList();
                    randomResultScreenController.normalServiceTime();
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
                  },)
                );

              },
                child: CommonOptionButton(buttonName: "Normal")
            ),
            SizedBox(height: 2.h,),
            InkWell(
              onTap: (){
                randomResultScreenController.MGoptions.value =2;
                Get.defaultDialog(
                    title: "M/G/S",
                    content: MGSDialogNormal( controller1: controllerLambda, controller2: controllerServiceMean, controller3: standardDeviation, controller4: server,tap: (){
                      randomResultScreenController.mean.value = double.parse(controllerLambda.text.toString());
                      randomResultScreenController.meanService.value = double.parse(controllerServiceMean.text.toString());
                      randomResultScreenController.variance.value = double.parse(standardDeviation.text.toString());
                      randomResultScreenController.servers.value = int.parse(server.text.toString());
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
                      randomResultScreenController.calculateGammaServiceTime();
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
                      Get.to(const RandomDataScreen());
                    },)
                );
              },
                child: CommonOptionButton(buttonName: "Gama"))
          ],
        ),
      ),
    );
  }
}
