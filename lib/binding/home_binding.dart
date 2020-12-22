import 'package:flutter_getx_obx_load_state/controller/home_controller.dart';
import 'package:flutter_getx_obx_load_state/controller/timer_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TimerController());
  }

}