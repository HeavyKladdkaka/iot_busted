import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:iot_busted/widgets/control_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IOT Busted"),
      ),
      body: _buildList(),
    );
  }
  
  Widget _buildList() {
    return new ControlButton();
  }

}