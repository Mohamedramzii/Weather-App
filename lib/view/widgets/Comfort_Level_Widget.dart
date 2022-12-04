import 'package:climate_guide/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Comfort_Level_Widget extends GetView<MainController> {
  const Comfort_Level_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Comfort level'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 300,
          child: Center(
              child: Obx(
            () => Column(
              children: [
                SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue:
                      controller.weatherdatamodel.value.current == null
                          ? 90
                          : controller.weatherdatamodel.value.current!.humidity!
                              .toDouble(), //humidity
                  appearance: CircularSliderAppearance(
                      size: 230,
                      animationEnabled: true,
                      infoProperties: InfoProperties(
                          mainLabelStyle: const TextStyle(
                              fontSize: 55, color: Colors.blueAccent),
                          bottomLabelText: 'Humidity',
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      customColors: CustomSliderColors(
                          // progressBarColor: Colors.blue
                          trackColor: Colors.grey.shade300,
                          hideShadow: true,
                          dynamicGradient: true,
                          progressBarColors: [
                            Colors.blue,
                            Colors.cyan,
                            Colors.lightBlue
                          ])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                        text: 'Feels Like: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text: controller.weatherdatamodel.value.current == null
                            ? '31'
                            : controller
                                .weatherdatamodel.value.current!.feelsLike!
                                .round()
                                .toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 2,
                        ),
                      ),
                    ])),
                    Container(
                      width: 1,
                      height: 15,
                      color: Colors.grey,
                    ),
                    RichText(
                        text:  TextSpan(children: [
                      const TextSpan(
                        text: 'UV index: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text:controller.weatherdatamodel.value.current == null
                            ? '31'
                            : controller
                                .weatherdatamodel.value.current!.uvi!
                                .round()
                                .toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 2,
                        ),
                      ),
                    ]))
                  ],
                )
              ],
            ),
          )),
        )
      ],
    );
  }
}
