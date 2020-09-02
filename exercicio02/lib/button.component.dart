import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  String title;
  Color color;

  ButtonComponent({
    @required this.title,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        color: color,
        onPressed: () {
          print('Click $title');
        },
      ),
    );
  }
}
