import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:climate_guide/controller/global_controller.dart';

class Daily_Data_Forecast_widget extends GetView<MainController> {
  const Daily_Data_Forecast_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.45,
      margin: const EdgeInsets.all(15),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center ,
              child: const Text(
                'Next Days',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: controller.weatherdatamodel.value.daily == null
                      ? 7
                      : controller.weatherdatamodel.value.daily!.length,
                  itemBuilder: (context, index) {
                    return Obx(() => Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: DaysList(
                                timestamp:
                                    controller.weatherdatamodel.value.daily ==
                                            null
                                        ? 0
                                        : controller.weatherdatamodel.value
                                            .daily![index].dt,
                                icon: controller.weatherdatamodel.value.daily ==
                                        null
                                    ? 'assets/icons/clouds.png'
                                    : 'assets/weather/${controller.weatherdatamodel.value.daily![index].weather![0].icon}.png',
                                mintemp:
                                    controller.weatherdatamodel.value.daily ==
                                            null
                                        ? 0
                                        : controller.weatherdatamodel.value
                                            .daily![index].temp!.min!
                                            .round()
                                            .toInt(),
                                maxtemp:
                                    controller.weatherdatamodel.value.daily ==
                                            null
                                        ? 0
                                        : controller.weatherdatamodel.value
                                            .daily![index].temp!.max!
                                            .round()
                                            .toInt(),
                              ),
                            ),
                            const Divider(
                              indent: 180,
                              endIndent: 180,
                              color: Colors.black38,
                            )
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class DaysList extends StatelessWidget {
  int? timestamp;
  String? icon;
  int? mintemp;
  int? maxtemp;

  DaysList({
    Key? key,
    this.timestamp,
    this.icon,
    this.mintemp,
    this.maxtemp,
  }) : super(key: key);

  String getDay(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String x = DateFormat('EEEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.45,
      height: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: 150,
              child: Text(
                getDay(timestamp!),
                style: GoogleFonts.alice(
                  textStyle: const TextStyle(
                  fontSize: 23
                ),
                )
              )),
          Image.asset(icon!),
          Row(
            children: [
              Text('${mintemp.toString()}° / ',style:const TextStyle(fontSize:20)),
              Text('${maxtemp.toString()}°',style:const TextStyle(fontSize:20)),
            ],
          )
        ],
      ),
    );
  }
}
