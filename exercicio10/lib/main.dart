import 'package:exercicio10/ui/pages/home.page.dart';
import 'package:exercicio10/ui/pages/search_brand.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static Map<String, WidgetBuilder> routes = {
    HomePage.route: (BuildContext context) => HomePage(),
    SearchBrandPage.route: (BuildContext context) =>
        SearchBrandPage(ModalRoute.of(context).settings.arguments),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      initialRoute: HomePage.route,
      routes: routes,
    );
  }
}
