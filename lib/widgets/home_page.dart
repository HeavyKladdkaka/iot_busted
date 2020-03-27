import 'package:flutter/material.dart';
import 'package:iot_busted/widgets/camera.dart';
import 'package:iot_busted/widgets/display_temperature.dart';
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
      body:_buildList(),
    );
  }
  
  Widget _buildList() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: DisplayTemperature(),
        ),
        Camera(),
        ControlButton(),
      ],
    );
  }
}