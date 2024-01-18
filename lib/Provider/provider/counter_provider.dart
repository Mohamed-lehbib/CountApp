import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

  void restartCounter() {
    counter = 0;
    notifyListeners();
  }
}
