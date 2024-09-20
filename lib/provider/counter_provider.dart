import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0, count2 = 0;

  void add() {
    count++;
    notifyListeners();
  }

  void subtract() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }

  void addCount2() {
    count2++;
    notifyListeners();
  }
}
