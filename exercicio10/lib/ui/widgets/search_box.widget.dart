import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String text;
  final Function onChange;

  SearchBox({
    this.text,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          contentPadding: EdgeInsets.all(15.0),
          hintText: text,
          fillColor: Colors.blue,
        ),
        onChanged: (string) => onChange(string),
      ),
    );
  }
}
