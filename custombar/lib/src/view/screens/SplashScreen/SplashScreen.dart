import 'package:custombar/src/controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  SplashController splashController = Get.put(SplashController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Simmulation project ",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp)
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Presented to DR.Shaista Raees",
                  style: (TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,)),
                ),
                SizedBox(height: 20),
                Container(
                    height: 60.h,
                    width: 80.w,
                    child: Lottie.asset("assets/images/lf20_fpeqspfn.json")),
                // Container(
                //   height: 0.13.sh,
                //   width: 0.13.sw,
                //   child: SpinKitFoldingCube(
                //     color: Colors.white.withOpacity(0.2),
                //     duration: Duration(seconds: 5),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
