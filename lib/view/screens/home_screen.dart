// ignore_for_file: prefer_const_constructors

import 'package:climate_guide/view/widgets/header_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_controller.dart';
import '../widgets/Comfort_Level_Widget.dart';
import '../widgets/Daily_Data_Forecast_widget.dart';
import '../widgets/Hourly_Data_Widget.dart';
import '../widgets/current_weather_widget.dart';

class Home_screen extends StatelessWidget {
  Home_screen({Key? key}) : super(key: key);
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SafeArea(
            child: Obx(() => controller.checkLoading().isTrue
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/clouds.png'),
                        CircularProgressIndicator(),
                      ],
                    ),
                )
                : ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Header_widget(),
                      Current_Weather_widget(),
                      Hourly_Data_Widget(),
                      Daily_Data_Forecast_widget(),
                      Comfort_Level_Widget(),
                    ],
                  ))));
    // );
  }
}
