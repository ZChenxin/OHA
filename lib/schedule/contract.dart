import 'package:hwa_chong/mvp/framework.dart';
import 'package:hwa_chong/schedule/data.dart';

abstract class Presenter extends BasePresenter {
  void loadSchedule();
}

abstract class View extends BaseView<Presenter> {
  void showSchedule(List<ScheduleDetail> schedule);
}
