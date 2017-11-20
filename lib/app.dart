import 'package:flutter/material.dart';

class HcApp extends StatelessWidget {
  const HcApp() : super();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new ContainerScreen(),
    );
  }
}

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget title,
    Color color,
  })
      : item = new BottomNavigationBarItem(
    icon: icon,
    title: title,
    backgroundColor: color,
  );

  final BottomNavigationBarItem item;
}

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => new _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Text> _titles;

  @override
  void initState() {
    super.initState();

    _titles = [
      const Text("Schedule"),
      const Text("Map"),
      const Text("Curriculum"),
      const Text("Info"),
    ];

    _navigationViews = [
      new NavigationIconView(
        icon: const Icon(Icons.schedule),
        title: _titles[0],
        color: Colors.red,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.map),
        title: _titles[1],
        color: Colors.red,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.book),
        title: _titles[2],
        color: Colors.red,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.info),
        title: _titles[3],
        color: Colors.red,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: _titles[_currentIndex],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
