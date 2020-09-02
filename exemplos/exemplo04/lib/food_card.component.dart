import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodCardComponent extends StatelessWidget {
  int position;

  FoodCardComponent(this.position);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.yellow,
        child: Stack(children: [
          Image.asset('assets/images/position$position.png'),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text('First Dish'),
                    Column(
                      children: [
                        Row(children: [
                          Text('601', style: TextStyle(color: Colors.white),),
                          Icon(Icons.chat_bubble, size: 12, color: Colors.white,),
                        ]),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
