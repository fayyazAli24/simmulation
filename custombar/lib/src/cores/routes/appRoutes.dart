

import 'package:custombar/src/cores/routes/routeNames.dart';
import 'package:custombar/src/view/screens/homeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final routes = [

    GetPage(
      name: RouteNames.homeScreen,
      page: () =>  HomeScreen(),
    ),

  ];
}
