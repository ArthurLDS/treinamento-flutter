import 'package:exercicio05/pages/login.page.dart';
import 'package:flutter/material.dart';

import 'pages/register.page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  Map<String, WidgetBuilder> privateRoutes = {
    LoginPage.route: (BuildContext context) => LoginPage(),
    RegisterPage.route: (BuildContext context) => RegisterPage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.route,
      routes: privateRoutes,
    );
  }
}