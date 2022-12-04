import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/global_controller.dart';

class Current_Weather_widget extends GetView<MainController> {
  Current_Weather_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SizedBox(
          width: double.infinity,
          height: 290,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 13),
            elevation: 10,
            color: Colors.grey.shade200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  Current_Temperature_Data_widget(),
                  Current_Weather_Details_Widget(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // ignore: non_constant_identifier_names
  Widget Current_Temperature_Data_widget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          controller.weatherdatamodel.value.current == null
              ? 'assets/weather/02n.png'
              : 'assets/weather/${controller.weatherdatamodel.value.current!.weather![0].icon}.png',
        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.grey.shade300,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: controller.weatherdatamodel.value.current == null
                  ? ''
                  : '${controller.weatherdatamodel.value.current!.temp!.round().toString()}\u2103',
              style: const TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          TextSpan(
              text: controller.weatherdatamodel.value.current == null
                  ? ''
                  : controller
                      .weatherdatamodel.value.current!.weather![0].description
                      .toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 20))
        ])),
      ],
    );
  }

  Widget Current_Weather_Details_Widget() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade100),
              child: Image.asset(
                'assets/icons/windspeed.png',
              ),
            ),
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade100),
              child: Image.asset(
                'assets/icons/clouds.png',
              ),
            ),
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade100),
              child: Image.asset(
                'assets/icons/humidity.png',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              controller.weatherdatamodel.value.current == null
                  ? ''
                  : '${controller.weatherdatamodel.value.current!.windSpeed.toString()} km',
              style: const TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.weatherdatamodel.value.current == null
                  ? ''
                  : '${controller.weatherdatamodel.value.current!.clouds.toString()} %',
              style: const TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.weatherdatamodel.value.current == null
                  ? ''
                  : '${controller.weatherdatamodel.value.current!.humidity.toString()} %',
              style: const TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}
