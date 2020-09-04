import 'package:exercicio09/network/api.dart';
import 'package:flutter/cupertino.dart';

class PicOfDayPage extends StatefulWidget {
  @override
  _PicOfDayPageState createState() => _PicOfDayPageState();
}

class _PicOfDayPageState extends State<PicOfDayPage> {
  String _urlBreedImage = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadBreed();
  }

  _loadBreed() async {
    String urlImage = await Api().getRandomDog();
    setState(() {
      _urlBreedImage = urlImage;
    });
  }

  _getImage() {
    return _urlBreedImage.isEmpty
        ? CupertinoActivityIndicator()
        : Image.network(_urlBreedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        height: 400,
        child: _getImage(),
      ),
    );
  }
}
