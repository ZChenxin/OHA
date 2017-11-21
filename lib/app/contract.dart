import 'package:flutter/material.dart';
import 'package:hwa_chong/mvp/framework.dart';

abstract class Presenter implements BasePresenter {
  void navigateApp(int index);
}

abstract class View implements BaseView<Presenter> {
  void loadApp(String appBarTitle,
      List<BottomNavigationBarItem> navigationItems,
      int currentIndex,
      Widget body);
}
