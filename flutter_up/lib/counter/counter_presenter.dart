import 'package:flutter_up/counter/counter_view.dart';
import 'package:flutter_up/mvp/presenter.dart';

class CounterPresenter extends  Presenter<CounterView> {
  int count = 0;

  increment() {
    count++;
    getView()!.onIncrement(count);
  }

  decrement() {
    count--;
    getView()!.onDecrement(count);
  }
}