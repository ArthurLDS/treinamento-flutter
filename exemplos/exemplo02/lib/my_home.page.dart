import 'package:exemplo02/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int numberPeople = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _increasePeople(){
    setState(() {
      numberPeople++;
    });
  }

  _decreasePeople(){
    setState(() {
      numberPeople--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de pessoas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Número de pessoas',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            numberPeople.toString(),
            style: TextStyle(fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: _increasePeople,
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              CupertinoButton(
                onPressed: _decreasePeople,
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
