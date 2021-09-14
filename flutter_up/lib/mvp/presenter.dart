import 'package:flutter_up/mvp/mvp_view.dart';

class Presenter<T extends MvpView> {
  T? view;

  attachView(T view) {
    this.view = view;
  }

  deAttachView() {
    view = null;
  }

  T? getView(){
    return view;
  }

}