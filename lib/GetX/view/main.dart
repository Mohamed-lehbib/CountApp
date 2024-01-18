import 'package:counter_state_management/GetX/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: CounterApp());
  }
}

class CounterApp extends StatelessWidget {
  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.incrementCounter();
                    },
                    child: Text("+")),
                Obx(() {
                  print("Build Counter text");
                  return Text(controller.counter.value.toString());
                }),
                ElevatedButton(
                    onPressed: () {
                      controller.decrementCounter();
                    },
                    child: Text("-")),
              ],
            ),
            IconButton(
              onPressed: () {
                controller.restartCounter();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        )));
  }
}
