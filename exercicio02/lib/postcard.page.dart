import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.component.dart';
import 'category.component.dart';

class PostCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postcard"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            print('Exit APP');
          },
        ),
      ),
      body: Column(
        children: [
          CategoryComponent(
            icon: Icon(Icons.person, color: Colors.white),
            iconColor: Color(0xFFFC3875),
            title: 'Recipient',
            subtitle: 'Arthur Lima de Souza',
          ),
          CategoryComponent(
            icon: Icon(Icons.business, color: Colors.white),
            iconColor: Color(0xFFFCAB55),
            title: 'Address',
            subtitle: 'Rua Guarujá, 300, Bairro São José, Canoas, \nRio Grande do Sul, Brazil',
          ),
          CategoryComponent(
            icon: Icon(Icons.edit, color: Colors.white),
            iconColor: Color(0xFF22C0FC),
            title: 'Message',
            subtitle:
                'Lorem ipsum dolor sit amet,consectetur adipiscing elit. Proin ullamcorper fermentum enim, quis molestie erat mollis at.Pellentesque at scelerisque quam. Pellentesque dapibus libero sed diam tincidunt pretium. Ut volutpat risus vel lacus euismod ullamcorper. Nunc nisl dolor, semper a posuere non, lobortis quis odio.',
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ButtonComponent(
                  title: "SAVE DRAFT",
                  color: Color(0xFF767676),
                ),
                SizedBox(width: 16),
                ButtonComponent(
                  title: "REVIEW DESIGN",
                  color: Color(0xFFFC3875),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

