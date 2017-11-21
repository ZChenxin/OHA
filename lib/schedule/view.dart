import 'package:flutter/material.dart';
import 'package:hwa_chong/schedule/contract.dart';
import 'package:hwa_chong/schedule/data.dart';
import 'package:hwa_chong/schedule/presenter.dart';
import 'package:hwa_chong/schedule/repository.dart';

class ScheduleView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> implements View {
  Presenter _presenter;

  // Elements to be displayed in the widget.
  List<ScheduleDetail> _schedule;

  _ScheduleViewState() {
    setPresenter(new SchedulePresenter(this, new ScheduleRepository()));
  }

  @override
  void initState() {
    super.initState();

    _presenter.loadInitialQueries();
  }

  @override
  Widget build(BuildContext context) {
    if (!areContentsReady()) {
      return new Container();
    }

    final Iterable<Widget> listTiles =
    _schedule.map((ScheduleDetail item) => buildListTile(item));
    return new Scrollbar(
      child: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: listTiles.toList(),
      ),
    );
  }

  bool areContentsReady() {
    return _schedule != null;
  }

  Widget buildListTile(ScheduleDetail item) {
    return new MergeSemantics(
      child: new ListTile(
        title: new Text(item.title),
        subtitle: new Text(item.subtitle),
      ),
    );
  }

  @override
  void setPresenter(Presenter presenter) {
    _presenter = presenter;
  }

  @override
  void showSchedule(List<ScheduleDetail> schedule) {
    setState(() {
      _schedule = schedule;
    });
  }
}
