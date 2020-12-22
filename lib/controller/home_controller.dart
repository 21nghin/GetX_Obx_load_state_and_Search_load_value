import 'dart:async';

import 'package:flutter_getx_obx_load_state/controller/timer_controller.dart';
import 'package:flutter_getx_obx_load_state/model/pet.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = List<String>().obs;

  Pet myPet = Pet(name: 'Lulu', age: 1);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final TimerController timerController = Get.find<TimerController>();
    _subscription = timerController.message.listen((String data) {
      print('message:::::::::::::::: $data');
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void onIncrement() {
    counter.value++;
  }

  void onGetDate() {
    currentDate.value = DateTime.now().toString();
  }

  void onAddItem() {
    items.add(DateTime.now().toString());
  }

  void onRemoveItem(int index) {
    items.removeAt(index);
  }

  void setPetAge(int age) {
    myPet.age = age;
    // myPet.value = myPet.value.copyWith(age: age);
  }
}
