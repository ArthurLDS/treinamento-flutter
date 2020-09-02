import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  _onPlusButtonPressed() {
    print('bla bla bla');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Current Pontifolio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF413E65),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 55,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'BALANCE',
                style: TextStyle(fontSize: 15, color: Color(0X80ffffff)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '\$200,345',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  Text(
                    ',00',
                    style: TextStyle(fontSize: 34, color: Color(0X80FFFFFF)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '\$200',
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'today',
                    style: TextStyle(fontSize: 15, color: Color(0X80ffffff)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Your Coins:',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: _onPlusButtonPressed,
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.green, fontSize: 40),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.red,
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Color(0x40FFFFFF),
                      ),
                      height: 38,
                      width: 38,
                      child: Center(
                        child: Text(
                          'B',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('BTB'),
                            Text('BTB'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
