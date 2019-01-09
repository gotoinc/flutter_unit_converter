import 'package:flutter/material.dart';
import 'package:unit_converter/widget/input_section.dart';

class ConverterGroup extends StatelessWidget {
  final inputWidget = InputSection();
  final outputWidget = InputSection();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      inputWidget,
      Center(
          child: RotatedBox(
              quarterTurns: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(1))),
//                  TODO: change ripple figure from circle to square
                  child: IconButton(
                      icon: Icon(Icons.compare_arrows, color: Colors.white),
                      color: Colors.white,
                      iconSize: 24,
                      highlightColor: Colors.greenAccent.shade400,
                      onPressed: () {
                        String temp = inputWidget.getInputtedText();
                        inputWidget.setTextToTextField(outputWidget.getInputtedText());
                        outputWidget.setTextToTextField(temp);
                      })))),
      outputWidget
    ]));
  }
}
