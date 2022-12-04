import 'package:climate_guide/binding/bindings.dart';
import 'package:climate_guide/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Guide'.toUpperCase(),
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      initialRoute: AppRoute.homeScreen,
      getPages: AppRoute.pages,
      initialBinding: binding(),
    );
  }
}
