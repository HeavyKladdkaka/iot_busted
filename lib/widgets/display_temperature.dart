import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DisplayTemperature extends StatefulWidget{ 
  @override
  DisplayTemperatureState createState() => new DisplayTemperatureState();
}

class DisplayTemperatureState extends State<DisplayTemperature>{

  var databaseReference = FirebaseDatabase.instance.reference();
  var temp;

  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((Event event){
      temp = event.snapshot.value['TEMPERATURE'];
    });
  }

Widget build(BuildContext context){
  String temperature  = temp.toString();
  print(temp);
  return Scaffold(
    body: 
    Row(
      children: <Widget>[
        Expanded(
        child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            style: BorderStyle.solid,
            color: Colors.lightBlue[300]
          ),
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.lightBlue[300],
      ),
    child: Center(
      child: new Text('Temp: '+
    temperature,
      
        style: new TextStyle(
          fontSize: 24.0,
        ),
      ),
    ),
    ),
   )
   ]), 
  );

}
}