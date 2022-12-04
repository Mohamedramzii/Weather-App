import 'package:climate_guide/view/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  //initial screen
  static const homeScreen = Routes.homeScreen;
  //screens

  static final pages = [
    GetPage(name: Routes.homeScreen, page: () => Home_screen())
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
}
