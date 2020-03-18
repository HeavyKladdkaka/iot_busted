import 'dart:ui';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SavedImage extends StatefulWidget {

  @override
  SavedImageState createState() => new SavedImageState();

}

class SavedImageState extends State<SavedImage> {

var _base64;

@override
void initState() {
  super.initState();
}

@override
Widget build(BuildContext context) {
      Uint8List byter;
      var db = FirebaseDatabase.instance.reference().child("CAMERA");
      db.once().then((DataSnapshot snapshot){
        _base64 = snapshot.value;
      });

      if(_base64 != null){
        var base64Decoder = new Base64Decoder();
        byter = base64Decoder.convert(_base64);
      }

    if(byter != null){
      return Scaffold(
          body: new ListTile(
              leading: new Image.memory(byter),
              title: new Text('_base64'),
        ), 
      );
    }
    else{
      return Scaffold(
        body: Center(
          child: new Image.asset('/assets/images/mountains.jpg')
        ), 
      );
    } 
  }
}

