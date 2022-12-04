import 'package:climate_guide/controller/global_controller.dart';
import 'package:get/get.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
  }
}
