import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final int day = 30;
  final String name = "Shaheer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Text("Welcome to $day days flutter tutorial by $name"),
      ),
      drawer: const Drawer(),
    );
  }
}
