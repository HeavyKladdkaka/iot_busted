import 'package:flutter/material.dart';
import 'package:iot_busted/widgets/control_button.dart';

/*class HomePage extends StatefulWidget {
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

}*/

import 'dart:ui';

import 'package:iot_busted/widgets/saved_image.dart';
//import 'dart:convert';
//import 'package:iot_busted/widgets/saved_image.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {
 final Set<Picture> _saved = Set<Picture>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IOT Busted"),
        actions: <Widget>[     
          IconButton(icon: Icon(Icons.folder), onPressed: _pushSaved),
          //SavedImage(),
          //ControlButton(),
        ], 
      ),
      body: _buildList(),
    );
  }
  
  Widget _buildList() {
    return new ControlButton(); //new Saved_image();
  }

   void _pushSaved() {
    Navigator.of(context).push( MaterialPageRoute<void>(  
      builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map(
         (Picture pair) {
            return ListTile( 
              //bilder
            );
          },
        ); 
        final List<Widget> divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();
          return Scaffold(         
            appBar: AppBar(
            title: Text('Saved images'),
          ),
          body: ListView(children: divided),
        );     
      },
    ), 
    );     
  }

}