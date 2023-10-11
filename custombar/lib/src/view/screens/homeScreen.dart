
import 'package:custombar/src/view/components/dialogBoxContainer.dart';
import 'package:custombar/src/view/components/mainPageContainer.dart';
import 'package:custombar/src/view/screens/dataResultScreen.dart';
import 'package:custombar/src/view/screens/optionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/randomResultScreenController.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomResultScreenController randomResultScreenController =
        Get.put(RandomResultScreenController());
    TextEditingController controllerlamda = TextEditingController();
    TextEditingController controllermiu = TextEditingController();
    TextEditingController controllerServers = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            MainPageContainer(
              text1: "It requires arrival and service mean values",
              text2: "It generates random poisson arrivals and exponential",
              text3: "services & estimates each componenet of system",
              buttonText: "SIMMULATE",
              colors: Colors.blue,
              textColors: Colors.white,
              borderColor: Colors.white,
              buttonColor: Colors.blue,
              onTap: () {
                Get.to(const OptionScreen());
              },
            ),
            MainPageContainer(
              text1: "The calculation on excel data is represented here",
              text2: "It generates dashboard of the collected data",
              text3: "and gives graphical representation of the data",
              buttonText: "Data",
              colors: Colors.white,
              textColors: Colors.blue,
              borderColor: Colors.white,
              buttonColor: Colors.blue,
              onTap: () {
                Get.to(DataResultScreen()
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
