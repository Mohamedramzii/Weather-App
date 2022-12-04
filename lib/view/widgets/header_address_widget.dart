import 'package:climate_guide/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Header_widget extends GetView<MainController> {
  const Header_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              controller.getCity().value,
              style: GoogleFonts.alef(
                  textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                controller.date,
                style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ],
        ),
      ));
  }
}
