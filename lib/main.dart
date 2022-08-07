import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        ThemeMode,
        Widget,
        runApp;
import 'package:learningapp/Pages/homepage.dart';
import 'package:learningapp/Pages/login.dart';
import 'package:learningapp/Utilities/routes.dart';
import 'Pages/homepage.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: MyRoutes.logInRoute,
      routes: {
        "/": (context) => LogIn(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.logInRoute: (context) => LogIn(),
      },
    );
  }
}
