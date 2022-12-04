
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/global_controller.dart';

class Hourly_Data_Widget extends GetView<MainController> {
  Hourly_Data_Widget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.topCenter,
            child: Text(
              'Today'.toUpperCase(),
              style: GoogleFonts.alef(
                  textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
            )),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.weatherdatamodel.value.hourly!=null ?
             controller.weatherdatamodel.value.hourly!.length > 12
                ? 12
                : controller.weatherdatamodel.value.hourly!.length : 0,
            itemBuilder: (context, index) {
              return  GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = index;
                  },
                  child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200,
                          gradient: controller.currentIndex.value == index
                              ? const LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.cyan,
                                  ],
                                )
                              : null),
                      child: Hourly_Details(
                        timestamp:
                            controller.weatherdatamodel.value.hourly![index].dt,
                        weatherIcon: 'assets/weather/${controller.weatherdatamodel.value.hourly![index].weather![0].icon}.png',
                     temp: controller.weatherdatamodel.value.hourly![index].temp!.round(),
                      )));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),)
        
      ]
    ));
  }
}

class Hourly_Details extends StatelessWidget {
  int? temp;
  int? timestamp;
  String? weatherIcon;

  String getTime(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  Hourly_Details({
    Key? key,
    this.temp,
    this.timestamp,
    this.weatherIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('at ${getTime(timestamp)}',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Image.asset(weatherIcon!),
           Text(
            '${temp.toString()}°',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
