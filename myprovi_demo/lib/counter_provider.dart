import 'package:flutter/cupertino.dart';
class CounterProvider extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }

  void subs() {
    _counter--;
    notifyListeners();
  }
}