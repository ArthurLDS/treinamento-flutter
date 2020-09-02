import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCalculate extends StatelessWidget {
  Color color;
  String title;
  Color textColor;
  int flex;
  Function onPressed;

  ButtonCalculate({
    @required this.color,
    @required this.title,
    this.textColor = Colors.white,
    this.flex = 1,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return _renderComponent();
  }

  _renderComponent() {
    return Expanded(
      flex: flex,
      child: Container(
        height: 86,
        child: RaisedButton(
          onPressed: () => onPressed(),
          color: this.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 34),
            ),
          ),
        ),
      ),
    );
  }
}
