
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState(){ return new _CameraState();
  }
}

class _CameraState extends State<Camera> {

  /*Future<Uint8List> _getImage() async{

    _bytes = await fetchImageString();

    return _bytes;

  }

  Future<Uint8List> fetchImageString() =>
    // Imagine that this function is
    // more complex and slow.
    _firebaseRef.once().then((DataSnapshot snapshot){
      String base64String = snapshot.value;
      print(base64String);

      Uint8List _bytes = base64.decode(base64String.split(',').last);

      return _bytes;
    });*/

  var _firebaseRef = FirebaseDatabase().reference().child('CAMERA');
  Image image;
  Uint8List _bytes;

  @override
  void initState() {
    super.initState();

    _firebaseRef.once().then((DataSnapshot snapshot){
      String base64String = snapshot.value;
      print(base64String);
      print(base64String.split(',').last);

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
                /*FutureBuilder(
                  future: _getImage(),
                  builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                    if (snapshot.hasData) {
                      return _imageBuilder(snapshot.data);
                    }
                    return CircularProgressIndicator();
                  },
                ),*/
  }

  /*Widget _imageBuilder(Uint8List data){
    return Image.memory(data);
  }*/
}