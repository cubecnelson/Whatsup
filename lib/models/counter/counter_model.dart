import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier {
  CounterModel(this.counter);
  int counter;

  void increment() {
    counter++;
    notifyListeners();
  }
}
