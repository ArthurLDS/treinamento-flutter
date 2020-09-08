import 'package:exercicio10/ui/pages/home.page.dart';
import 'package:exercicio10/ui/pages/search_brand.page.dart';
import 'package:exercicio10/ui/pages/search_model.page.dart';
import 'package:exercicio10/ui/pages/search_year.page.dart';
import 'package:exercicio10/ui/pages/vehicle_detail.page.dart';
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
    SearchModelPage.route: (BuildContext context) =>
        SearchModelPage(ModalRoute.of(context).settings.arguments),
    SearchYearPage.route: (BuildContext context) =>
        SearchYearPage(ModalRoute.of(context).settings.arguments),
    VehicleDetailPage.route: (BuildContext context) =>
        VehicleDetailPage(ModalRoute.of(context).settings.arguments),
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
