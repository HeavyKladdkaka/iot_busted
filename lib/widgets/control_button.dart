import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ControlButton extends StatefulWidget {
  @override
  _TurnOffButtonState createState() => _TurnOffButtonState();
}

class _TurnOffButtonState extends State<ControlButton> {

  var _firebaseRef = FirebaseDatabase().reference().child('Button');
  int _buttonValue = 0;

  sendMessage() {

    //_firebaseRef.child("Button").remove();

    _firebaseRef.update({
        "value": _buttonValue,
    });
  }

  bool _isOff = true;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: _toggleOnOff,
        label: (_isOff ? Text('Turn Off') : Text('Turn On')),
        icon: Icon(Icons.power_settings_new),
        backgroundColor: (_isOff ? Colors.pink : Colors.green[500]),
        
      );
  }

  void _toggleOnOff() {
    setState(() {
      if (_isOff) {
        _buttonValue = 1;
        _isOff = false;
        sendMessage();
      } else {
        _buttonValue = 0;
        _isOff = true;
        sendMessage();
      }
    });
  }
}



/*class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isOff = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}*/