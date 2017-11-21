import 'dart:async';

class ScheduleDetail {
  final String title;
  final String subtitle;
  final String startTime;
  final String endTime;
  final String location;

  const ScheduleDetail(this.title, this.subtitle, this.startTime, this.endTime,
      this.location);
}

abstract class Repository {
  Future<List<ScheduleDetail>> fetch();
}