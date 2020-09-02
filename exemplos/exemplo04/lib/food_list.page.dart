import 'package:exemplo04/food_card.component.dart';
import 'package:exemplo04/food_detail.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.utils.dart';

class FoodListPage extends StatefulWidget {
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delicia'),
        elevation: 0,
      ),
      body: Container(
        color: ColorUtils.regularBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int position) {
              return FoodCardComponent(position);
            },
          ),
        ),
      ),
    );
  }
}
