import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.purple[100])),
              Expanded(flex: 1, child: Container(color: Colors.purple[200])),
              Expanded(flex: 1, child: Container(color: Colors.purple[300])),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child:  Row(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.red[100])),
              Expanded(flex: 1, child: Container(color: Colors.red[200])),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.green[100])),
              Expanded(flex: 1, child: Container(color: Colors.green[200])),
              Expanded(flex: 1, child: Container(color: Colors.green[300])),
              Expanded(flex: 1, child: Container(color: Colors.green[400])),
            ],
          ),
        ),
      ],
    );
  }
}
