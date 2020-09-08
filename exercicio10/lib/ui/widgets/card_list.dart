import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String title;
  final Function onPress;

  CardList({
    this.title,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 15,
            bottom: 16,
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
