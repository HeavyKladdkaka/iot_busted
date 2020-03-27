
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState(){ return new _CameraState();
  }
}

class _CameraState extends State<Camera> {

  var _firebaseRef = FirebaseDatabase().reference().child('CAMERA');
  Image image;
  Uint8List _bytes;

  @override
  void initState() {
    super.initState();

    _firebaseRef.once().then((DataSnapshot snapshot){
      String base64String = snapshot.value;

      Uint8List bytes = base64.decode(base64String.split(',').last);

      setState(() {
        _bytes = bytes;
      });
    });

    _firebaseRef.onValue.listen((Event event){
      String base64String = event.snapshot.value;
      Uint8List bytes = base64.decode(base64String.split(',').last);

      setState(() {
        _bytes = bytes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Container(child: _bytes == null 
      ? new Text('No data')
      : new Image.memory(_bytes),
    );
                
  }
}