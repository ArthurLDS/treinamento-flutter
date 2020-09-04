import 'package:exercicio09/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBreedPage extends StatefulWidget {
  @override
  _SearchBreedPageState createState() => _SearchBreedPageState();
}

class _SearchBreedPageState extends State<SearchBreedPage> {
  String _urlBreedImage = '';
  TextEditingController _typeBreedController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _onChangeTypeBreed(value) {
    _loadBreed();
  }

  _loadBreed() async {
    String urlImage = await Api().getDogByBreed(_typeBreedController.text);
    setState(() {
      _urlBreedImage = urlImage;
    });
  }

  Widget _getImageDog() {
    if (_typeBreedController.text.isEmpty) return null;
    return _urlBreedImage.isNotEmpty
        ? Image.network(_urlBreedImage)
        : Image.asset('assets/images/viralata.jpeg');
  }

  Widget _getMessageError() {
    return _urlBreedImage.isEmpty && _typeBreedController.text.isNotEmpty
        ? Text('Breed Not Found', style: TextStyle(color: Colors.red))
        : null;
  }

  Widget _getButtonAnotherOne() {
    return _urlBreedImage.isNotEmpty
        ? RaisedButton(
            child: Text(
              'Another One',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _loadBreed,
            color: Colors.blue,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Type the breed you want to see:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _typeBreedController,
              onChanged: (String value) => _onChangeTypeBreed(value),
            ),
            SizedBox(height: 25),
            SizedBox(child: _getMessageError()),
            SizedBox(height: 10),
            SizedBox(height: 240, child: _getImageDog()),
            SizedBox(height: 25),
            SizedBox(child: _getButtonAnotherOne()),
          ],
        ),
      ),
    );
  }
}
