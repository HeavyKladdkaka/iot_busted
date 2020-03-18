import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iot_busted/widgets/saved_image.dart';
import 'package:iot_busted/widgets/display_temperature.dart';
import 'package:iot_busted/widgets/control_button.dart';
//import 'dart:convert';
//import 'package:iot_busted/widgets/saved_image.dart';

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
        
          //SavedImage(),
          //ControlButton(), 
      ),
      body:_buildList(),
    );
  }
  
  Widget _buildList() {
    return new ControlButton(); //new DisplayTemperature() //new Saved_image();
  }
}