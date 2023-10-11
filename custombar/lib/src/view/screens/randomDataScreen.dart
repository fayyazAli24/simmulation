import 'package:custombar/src/controller/randomResultScreenController.dart';
import 'package:custombar/src/view/screens/MGSscreen.dart';
import 'package:custombar/src/view/screens/RandomResultScreen.dart';
import 'package:custombar/src/view/screens/randsimResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'GraphicalResultScreen.dart';

class RandomDataScreen extends StatelessWidget {
  const RandomDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RandomResultScreenController randomResultScreenController = Get.put(RandomResultScreenController());
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.data_array,
                    color: Colors.white,
                  ),
                  text: "Random Data",
                ),
                // Tab(
                //     icon: Icon(Icons.data_array, color: Colors.white),
                //     text: "Randsim Data"),
                // Tab(
                //   icon: Icon(
                //     Icons.data_array,
                //     color: Colors.white,
                //   ),
                //   text: "Graphical view",
                // ),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              randomResultScreenController.MainOptions.value ==1?
               RandomResultScreen():MGSscreen(),
              // const RandsimScreen(),
              // GraphicalResultScreen(),
            ],
          ),
        ));
  }
}
