import 'package:hwa_chong/schedule/contract.dart';
import 'package:hwa_chong/schedule/data.dart';

class SchedulePresenter extends Presenter {

  Repository _repository;
  View _view;

  SchedulePresenter(this._view, this._repository);

  @override
  void loadInitialQueries() {
    loadSchedule();
  }

  @override
  void loadSchedule() {
    _repository.fetch()
        .then((schedule) => _view.showSchedule(schedule));
  }
}