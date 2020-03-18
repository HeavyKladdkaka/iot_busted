
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  var _firebaseRef = FirebaseDatabase().reference().child('CAMERA');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 200.0,
            child: StreamBuilder(
              stream: _firebaseRef.onValue,
              builder: (context, snap) {
                if (snap.hasData && !snap.hasError && snap.data.snapshot.value!=null) {
            
            //taking the data snapshot.
                    DataSnapshot snapshot = snap.data.snapshot;
                    List item=[];
                    String base64="";
            //it gives all the documents in this list.
                    base64=snapshot.value; 
            //Now we're just checking if document is not null then add it to another list called "item".
            //I faced this problem it works fine without null check until you remove a document and then your stream reads data including the removed one with a null value(if you have some better approach let me know).
                      if(base64!=null){

                        var base64Decoder = new Base64Decoder();
                        var byter = base64Decoder.convert(base64.split(',').last);
                        
                        item.add(new Image.memory(byter));
                      }
                    return snap.data.snapshot.value == null
            //return sizedbox if there's nothing in database.
                    ? SizedBox()
            //otherwise return a list of widgets.
                    : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item.length,
                    itemBuilder: (context, index) {
                      return _containerForCamera(
                        item[index]
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerForCamera(item){
    return item;
}
}