

import 'package:custombar/src/cores/routes/routeNames.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../view/screens/onBoarding/appLoader.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.appLoader,
      page: () => const AppLoader(),
    ),

  ];
}
