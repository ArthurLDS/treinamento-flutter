import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;

  ButtonMenu({
    @required this.title,
    @required this.icon,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Container(
        height: 80,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
      onPressed: onPress,
    );
  }
}
