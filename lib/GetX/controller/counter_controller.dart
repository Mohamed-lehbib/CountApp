import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() => counter++;
  void decrementCounter() => counter--;
  void restartCounter() => counter.value = 0;
}
