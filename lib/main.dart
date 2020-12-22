import 'package:flutter/material.dart';
import 'package:flutter_getx_obx_load_state/binding/home_binding.dart';
import 'package:flutter_getx_obx_load_state/controller/home_controller.dart';
import 'package:flutter_getx_obx_load_state/controller/timer_controller.dart';
import 'package:flutter_getx_obx_load_state/ui/home_screen.dart';
import 'package:get/get.dart';

void main() {
  // HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    // Get.put(TimerController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
      initialBinding: HomeBinding(),
    );
  }
}