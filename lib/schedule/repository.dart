import 'dart:async';

import 'package:hwa_chong/schedule/data.dart';

const kSchedule = const [
  const ScheduleDetail(
      "Wushu performance", "Wowzers!", "0930", "0940", "Central Plaza"),
  const ScheduleDetail(
      "MAD performance", "Woahh!", "0945", "1000", "Central Plaza"),
  const ScheduleDetail("Welcome talk", ":)", "1010", "1030", "Auditorium"),
  const ScheduleDetail(
      "School tour", ":(", "1100", "1130", "Lecture Theatre 3"),
];

/// Mock implementation of a [ScheduleRepository] for fetching schedule data.
class ScheduleRepository implements Repository {
  @override
  Future<List<ScheduleDetail>> fetch() {
    return new Future.value(kSchedule);
  }
}
