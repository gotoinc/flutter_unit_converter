import 'package:flutter/material.dart';
import 'package:unit_converter/route/unit_converter_route.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unit Converter',
        theme: ThemeData(
            primaryColor: Colors.greenAccent,
            scaffoldBackgroundColor: Colors.greenAccent,
            accentColor: Colors.white,
            cursorColor: Colors.white),
        home: UnitConverterScreen());
  }
}
