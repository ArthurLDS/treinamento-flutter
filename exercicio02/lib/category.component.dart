import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  Icon icon;
  Color iconColor;
  String title;
  String subtitle;

  CategoryComponent({
    @required this.icon,
    @required this.iconColor,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: this.iconColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: this.icon,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                width: 300,
                child: Text(this.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
