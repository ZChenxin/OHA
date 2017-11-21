import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwa_chong/app/data.dart';

const AppDetail kAppDetail = const AppDetail(
  const [
    const NavigationView("Schedule", Icons.schedule),
    const NavigationView("Map", Icons.map),
    const NavigationView("Curriculum", Icons.book),
    const NavigationView("Info", Icons.info),
  ],
);

class AppRepository implements Repository {

  @override
  Future<AppDetail> fetch() {
    return new Future.value(kAppDetail);
  }
}