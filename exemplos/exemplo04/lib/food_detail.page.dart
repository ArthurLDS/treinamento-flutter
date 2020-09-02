import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delicia'),
        elevation: 0,
      ),
      body: Container(
        color: Colors.red,
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ir pra la'),
        ),
      ),
    );
  }
}
