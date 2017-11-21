import 'package:flutter/material.dart';
import 'package:hwa_chong/app/contract.dart';
import 'package:hwa_chong/app/presenter.dart';
import 'package:hwa_chong/app/repository.dart';

class HcApp extends StatelessWidget {
  const HcApp() : super();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => new _AppViewState();
}

class _AppViewState extends State<AppView> implements View {
  Presenter _presenter;

  // Elements to be displayed in the widget.
  String _appBarTitle;
  List<BottomNavigationBarItem> _bottomNavigationBarItems;
  int _currentIndex = -1;
  Widget _body;

  _AppViewState() {
    setPresenter(new AppPresenter(this, new AppRepository()));
  }

  @override
  void initState() {
    super.initState();

    _presenter.loadInitialQueries();
  }

  @override
  Widget build(BuildContext context) {
    if (!areContentsReady()) {
      return new Scaffold(
        appBar: new AppBar(),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_appBarTitle),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int newIndex) => _presenter.navigateApp(newIndex),
      ),
      body: _body,
    );
  }

  /// True if all data has been fetched and is ready to be displayed.
  bool areContentsReady() {
    return _currentIndex >= 0 &&
        _appBarTitle != null &&
        _bottomNavigationBarItems != null &&
        _body != null;
  }

  @override
  void setPresenter(Presenter presenter) {
    _presenter = presenter;
  }

  @override
  void loadApp(String appBarTitle,
      List<BottomNavigationBarItem> bottomNavigationBarItems,
      int currentIndex,
      Widget body) {
    setState(() {
      _appBarTitle = appBarTitle;
      _bottomNavigationBarItems = bottomNavigationBarItems;
      _currentIndex = currentIndex;
      _body = body;
    });
  }
}
