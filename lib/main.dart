import 'package:flutter/material.dart';
import 'package:unit_converter/widget/converter.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unit Converter',
        theme: ThemeData(
            primaryColor: Colors.greenAccent,
            scaffoldBackgroundColor: Colors.greenAccent,
            cursorColor: Colors.white),
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.black),
          title: Text("Unit Converter".toUpperCase(),
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal)),
          centerTitle: true,
          elevation: 0,
        ),
        body: ConverterGroup());
  }
}
