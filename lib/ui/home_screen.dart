import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_obx_load_state/controller/home_controller.dart';
import 'package:flutter_getx_obx_load_state/controller/timer_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({this.title});

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        print('======================> build Controller');
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoTextField(
                    onChanged: (text) {
                      timerController.setSearchText(text);
                    },
                  ),
                  const SizedBox(height: 15),
                  Text('5s sẽ có 1 tin nhắn'),
                  const SizedBox(height: 3),
                  Obx(() => Text('${timerController.message.value}')),
                  Obx(() => Text('${controller.myPet.age}')),
                  FlatButton(
                    onPressed: () => controller.setPetAge(controller.myPet.age + 1),
                    child: Text('set age'),
                  )
                ],
              ),
            )
            // Obx(
            //   () => ListView.builder(
            //     itemBuilder: (_, index) {
            //       final String text = controller.items[index];
            //       return ListTile(
            //         title: Text(text),
            //         trailing: IconButton(
            //           icon: Icon(Icons.delete),
            //           onPressed: () => controller.onRemoveItem(index),
            //         ),
            //       );
            //     },
            //     itemCount: controller.items.length,
            //   ),
            // ),
            // floatingActionButton: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: 'add',
            //       backgroundColor: Colors.green[400],
            //       child: Icon(Icons.add),
            //       onPressed: controller.onAddItem,
            //     ),
            //     const SizedBox(width: 15),
            //     FloatingActionButton(
            //       heroTag: 'date',
            //       backgroundColor: Colors.blue[400],
            //       child: Icon(Icons.calendar_today),
            //       onPressed: controller.onGetDate,
            //     ),
            //   ],
            // ),
            );
      },
    );
  }
}
