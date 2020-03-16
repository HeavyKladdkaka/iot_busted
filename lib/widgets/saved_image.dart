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

String _base64 = "";

@override
void initState() {
  super.initState();
}

@override
Widget build(BuildContext context) {
      _base64 = getData(_base64);
      var base64Decoder = new Base64Decoder();
      Uint8List byter = base64Decoder.convert(_base64); 
      return Scaffold(
        body: Center(
          child: new Image.memory(byter)
        ), 
      );
  }
}

String getData(String _base64){
  var db = FirebaseDatabase.instance.reference().child("CAMERA");
  db.once().then((DataSnapshot snapshot){
    if(_base64 != snapshot.toString())
      return snapshot.toString();
    else{
      return null;
    }
  });
  return null;
 }
