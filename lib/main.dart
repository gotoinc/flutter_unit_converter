import 'package:flutter/material.dart';
import 'package:unit_converter/vpr/view/unit_converter_screen.dart';
import 'package:unit_converter/style/consts/colors.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'MontereyFLF',
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
