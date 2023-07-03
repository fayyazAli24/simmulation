import 'package:custombar/src/controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  SplashController splashController=Get.put(SplashController());
  @override

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
         color: Colors.white          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.2,
                ),
                Text(
                  "DR.Shaista Rais",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.merge(TextStyle(
                      fontSize: 3.h,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
                ),
                SizedBox(height:20 ),
                Container(
                    height: 60.h,
                    width: 80.w
                    ,
                    child: Lottie.asset("assets/images/lf20_fpeqspfn.json")
                ),

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
        )

    );
  }
}
