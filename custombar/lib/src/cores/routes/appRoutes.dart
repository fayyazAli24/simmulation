

import 'package:custombar/src/cores/routes/routeNames.dart';
import 'package:custombar/src/view/screens/SplashScreen/SplashScreen.dart';
import 'package:custombar/src/view/screens/homeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const homeScreen = '/homeScreen';

static final routes = [

    GetPage(
      name:homeScreen,
      page: () =>  HomeScreen(),
    ),
    GetPage(
      name: RouteNames.splashScreen,
      page: () =>  SplashScreen(),
    ),

  ];
}
