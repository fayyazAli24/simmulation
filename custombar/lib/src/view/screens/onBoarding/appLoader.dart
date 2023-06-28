
import 'package:flutter/material.dart';

import '../homeScreen.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {

  Future<bool> dummyTimer() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    // Get.toNamed('/loginScreen');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          dummyTimer(),
        ]),
        builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
          if (snapshot.hasData) {
            if ((snapshot.data?[0] ?? true) == false) {
              return  HomeScreen();
            } else {
              return   HomeScreen();
            }
          }
          else{
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100),
                child: const Align(
                  alignment: Alignment.center,
                  child:Text("hello")
                ),
              ),
            );}
        }
      // }
    );
  }
}
