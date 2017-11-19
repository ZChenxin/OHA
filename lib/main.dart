import 'package:flutter/material.dart';

void main() {
  runApp(new HcApp());
}

class HcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hwa Chong",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new MainScreen(title: 'Hwa Chong'),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String title;

  MainScreen({this.title});

  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.schedule), title: new Text("Schedule")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.map), title: new Text("Map")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.book), title: new Text("Curriculum")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.info), title: new Text("Info")),
      ]),
    );
  }
}
