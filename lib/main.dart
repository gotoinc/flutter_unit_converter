import 'package:flutter/material.dart';
import 'package:unit_converter/route/unit_converter_route.dart';
import 'package:unit_converter/style/consts/colors.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
//            fontFamily: "Raleway",
//            textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor, displayColor: textColor),
            primaryColor: mainColorApp,
            scaffoldBackgroundColor: mainColorApp,
            highlightColor: colorHighlight,
            splashColor: colorHighlightSplash,
            accentColor: textColor,
            cursorColor: cursorColor,
            textSelectionHandleColor: cursorColor,
            textSelectionColor: colorHighlight),
        home: UnitConverterScreen());
  }
}
