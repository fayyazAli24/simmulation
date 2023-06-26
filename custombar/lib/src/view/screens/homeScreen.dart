import 'package:custombar/src/view/components/customInputField.dart';
import 'package:custombar/src/view/components/dialogBoxContainer.dart';
import 'package:custombar/src/view/components/mainPageContainer.dart';
import 'package:custombar/src/view/screens/randomDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              child: MainPageContainer(
            text1: "It requires arrival and service mean values",
            text2: "It generates random poisson arrivals and exponential",
            text3: "services & estimates each componenet of system",
            buttonText: "RANDOM",
            colors: Colors.blue,
            textColors: Colors.white,
            borderColor: Colors.white,
            buttonColor: Colors.blue,
            onTap: (){
              Get.defaultDialog(
                title: 'M/M/Servers(s)',
                content: DialogBoxContainer(tap: (){
                  Get.to(RandomDataScreen());
                },)
                  );
            },

          )),
          Expanded(child: MainPageContainer(
            text1: "It requires arrival and service mean values",
            text2: "It generates dashboard of the collected data",
            text3: "and gives graphical representation of the data",
            buttonText: "Data",
            colors: Colors.white,
            textColors: Colors.blue,
            borderColor: Colors.white,
            buttonColor: Colors.blue,
            onTap: (){
              Get.defaultDialog(
                  title: 'M/M/Servers(s)',
                  content: DialogBoxContainer(tap: (){
                    Get.to(RandomDataScreen());
                  },
                  )
              );
            },
          ))
          // Expanded(child:)
        ],
      ),
    ));
  }
}
