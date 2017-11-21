import 'package:flutter/material.dart';
import 'package:hwa_chong/app/contract.dart';
import 'package:hwa_chong/app/data.dart';
import 'package:hwa_chong/schedule/view.dart';

class AppPresenter extends Presenter {
  static const SCHEDULE_INDEX = 0;
  static const MAP_INDEX = 1;
  static const CURRICULUM_INDEX = 2;
  static const INFO_INDEX = 3;
  static const INITIAL_NAVIGATION_INDEX = SCHEDULE_INDEX;

  final Repository _repository;
  final View _view;

  AppDetail _appDetail;

  AppPresenter(this._view, this._repository);

  @override
  void loadInitialQueries() {
    _repository.fetch().then((appDetail) {
      _appDetail = appDetail;
      navigateApp(INITIAL_NAVIGATION_INDEX);
    });
  }

  @override
  void navigateApp(int index) {
    final String title = _appDetail.navigationViews[index].title;

    final List<BottomNavigationBarItem> bottomNavigationBarItems = _appDetail
        .navigationViews
        .map((navigationView) =>
    new BottomNavigationBarItem(
        icon: new Icon(navigationView.iconData),
        title: new Text(navigationView.title)))
        .toList();

    // Flutter doesn't support Dart's MirrorSystem API, which is
    // an API similar to Java's Reflection API.
    // Hence, we have to move some logic pertaining to the individual
    // tabs from the Repository into the Presenter itself.
    //
    // TODO: Instantiate the appropriate views once implemented.
    Widget body;
    switch (index) {
      case SCHEDULE_INDEX:
        body = new ScheduleView();
        break;
      case MAP_INDEX:
        body = new ScheduleView();
        break;
      case CURRICULUM_INDEX:
        body = new ScheduleView();
        break;
      case INFO_INDEX:
        body = new ScheduleView();
        break;
    }

    _view.loadApp(title, bottomNavigationBarItems, index, body);
  }
}
