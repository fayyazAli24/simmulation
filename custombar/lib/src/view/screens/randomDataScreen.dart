import 'package:custombar/src/view/components/customTabBar.dart';
import 'package:custombar/src/view/screens/RandomResultScreen.dart';
import 'package:custombar/src/view/screens/randsimResultScreen.dart';
import 'package:flutter/material.dart';

import 'GraphicalResultScreen.dart';

class RandomDataScreen extends StatelessWidget {
  const RandomDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
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
                Tab(
                    icon: Icon(Icons.data_array, color: Colors.white),
                    text: "Randsim Data"),
                Tab(
                  icon: Icon(
                    Icons.data_array,
                    color: Colors.white,
                  ),
                  text: "Graphical view",
                ),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
               RandomResultScreen(),
              const RandsimScreen(),
              GraphicalResultScreen()
            ],
          ),
        ));
  }
}
