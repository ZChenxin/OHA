import 'dart:async';

import 'package:flutter/material.dart';

/// Contains data of elements to be displayed in the View.
class AppDetail {
  final List<NavigationView> navigationViews;

  const AppDetail(this.navigationViews);
}

/// Contains data of a navigation item in the navigation bar.
class NavigationView {
  final String title;
  final IconData iconData;

  const NavigationView(this.title, this.iconData);
}

abstract class Repository {
  Future<AppDetail> fetch();
}