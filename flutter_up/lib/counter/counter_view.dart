import 'package:flutter_up/mvp/mvp_view.dart';

abstract class CounterView extends MvpView {
  void onIncrement(int value);
  void onDecrement(int value);
}