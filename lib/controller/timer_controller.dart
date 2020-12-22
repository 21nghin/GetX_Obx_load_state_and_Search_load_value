import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxString _message = "".obs;
  RxString _searchText = "".obs;
  RxInt _counter = 0.obs;

  RxString get message => _message;

  Timer _timer, _timerCounter;
  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    /// action search
    // ever(_searchText, (_) => print('lalalalalalaalal'));

    //TODO trường hợp nhập xong văn bản rồi mới in ra
    // debounce(_searchText, (_){
    //   print('${_searchText.value}');
    // },time: Duration(milliseconds: 500));

    //TODO trường hợp đang nhập cứ 500 milliseconds sẽ in ra (chú ý ngừng gõ sẽ ngừng in ra)
    interval(_searchText, (_){
      print('${_searchText.value}');
    },time: Duration(milliseconds: 500));

    // ever(_counter, (_) => print('_counter đã được thay đổi ${_counter.value}'));
    once(_counter, (_) => print('_counter đã được thay đổi ${_counter.value}'));

    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) => _message.value = _faker.lorem.sentence(),
    );

    _timerCounter = Timer.periodic(
      Duration(seconds: 1),
      (timer) => _counter++,
    );
  }

  void setSearchText(String text){
    _searchText.value = text;
  }

  @override
  void onClose() {
    /// trạng thái Hủy
    if (_timer != null) {
      _timer.cancel();
    }
    if (_timerCounter != null) {
      _timer.cancel();
    }
    super.onClose();
  }
}
