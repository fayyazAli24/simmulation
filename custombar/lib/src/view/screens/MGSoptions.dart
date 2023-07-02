import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/components/MGSdialogContainer.dart';
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
    TextEditingController upper = TextEditingController();
    TextEditingController lower = TextEditingController();
    TextEditingController server = TextEditingController();
    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
               Get.defaultDialog(

                 title: "M/G/S",
                 content: MGSdefaultDialog(
                   controller1: controllerLambda, controller2: upper, controller3: lower, controller4: server,
                   tap: (){
                   randomResultScreenController.mean.value =
                       double.parse(controllerLambda.text.toString());

                   randomResultScreenController.upperLimit.value =
                       int.parse(upper.text.toString());

                   randomResultScreenController.lowerLimit.value = int.parse(lower.text.toString());
                   randomResultScreenController.servers.value =
                   int.tryParse(server.text.toString())!;

                   print(randomResultScreenController.lowerLimit.toString());
                   print(randomResultScreenController.lowerLimit.toString());
                   print(randomResultScreenController.arrivalList);
                   print(randomResultScreenController.serviceList);


                   randomResultScreenController
                       .calculateProbablityUsingPoisson();
                   randomResultScreenController
                       .interArrivalTimeCalculator();
                   randomResultScreenController.calculateArrivalList();
                   // randomResultScreenController.serviceTimeCalculator();
                   randomResultScreenController.calculateMGserviceTime();
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


                   Get.to( const RandomDataScreen());

                 },
                 )
               );
              },
                child: CommonOptionButton(buttonName: "Uniform")),
            SizedBox(height: 2.h,),
            CommonOptionButton(buttonName: "Normal"),
            SizedBox(height: 2.h,),
            CommonOptionButton(buttonName: "Gama")
          ],
        ),

      ),
    );
  }
}
