import 'package:custombar/src/cores/routes/appRoutes.dart';
import 'package:custombar/src/cores/routes/routeNames.dart';
import 'package:custombar/src/view/screens/SplashScreen/SplashScreen.dart';
import 'package:custombar/src/view/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'package:flutter_voip_kit/app_routes.dart';
// import 'package:flutter_voip_kit/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splashScreen,
        getPages: AppRoutes.routes,
        home:  SplashScreen(),
      );
    });
  }
}
