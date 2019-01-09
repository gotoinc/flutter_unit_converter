import 'package:flutter/material.dart';
import 'package:unit_converter/widget/input_section.dart';

class ConverterGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      InputSection(),
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
                  child: IconButton(
                      icon: Icon(Icons.compare_arrows, color: Colors.white),
                      color: Colors.white,
                      highlightColor: Colors.white12,
                      iconSize: 24,
                      onPressed: () {

                      })))),
      InputSection()
    ]));
  }
}
