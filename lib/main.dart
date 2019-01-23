import 'package:flutter/material.dart';
import 'package:unit_converter/route/unit_converter_route.dart';
import 'package:unit_converter/style/consts/colors.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unit Converter',
        theme: ThemeData(
            primaryColor: mainColorApp,
            scaffoldBackgroundColor: mainColorApp,
            highlightColor: colorHighlight,
            splashColor: colorHighlightSplash,
            accentColor: textColor,
            cursorColor: cursorColor),
        home: UnitConverterScreen());
  }
}
