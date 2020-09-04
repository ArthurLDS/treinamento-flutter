import 'package:exercicio09/ui/pic_day.page.dart';
import 'package:exercicio09/ui/search_breed.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<StatefulWidget> _pages = [SearchBreedPage(), PicOfDayPage()];
  int _currentIndex = 0;

  _onTapNavigation(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _loadPage() => _pages[_currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wellcome to Paw City'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/paw.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.06), BlendMode.dstIn)
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _loadPage(),
            ),
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTapNavigation,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search for breed'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Pic of the day'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
