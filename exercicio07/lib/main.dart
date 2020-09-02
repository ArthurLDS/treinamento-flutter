import 'package:exercicio7start/ui/news_detail.page.dart';
import 'package:exercicio7start/ui/news_feed.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsFeedPage.route,
      routes: {
        NewsFeedPage.route: (context) => NewsFeedPage(),
        NewsDetailPage.route: (context) =>
            NewsDetailPage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
