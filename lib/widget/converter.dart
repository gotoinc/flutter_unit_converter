import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/widget/input_section.dart';

class ConverterGroup extends StatelessWidget {
  final inputWidget = InputSection();
  final outputWidget = InputSection();

  @override
  Widget build(BuildContext context) {
    return Container(child: OrientationBuilder(builder: (context, orientation) {
      return _getRootWidget(orientation);
    }));
  }

  Widget _getRootWidget(Orientation orientation) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView(children: <Widget>[
          IntrinsicHeight(
              child: orientation == Orientation.landscape
                  ? _rowForLandscapeOrientation()
                  : _columnForPortraitOrientation())
        ]));
  }

  Widget _rowForLandscapeOrientation() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: inputWidget),
          DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: textColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.zero)),
              child: InkWell(
                  borderRadius: BorderRadius.all(Radius.zero),
                  onTap: () {
                    String temp = inputWidget.getInputtedText();
                    inputWidget
                        .setTextToTextField(outputWidget.getInputtedText());
                    outputWidget.setTextToTextField(temp);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.compare_arrows,
                          color: textColor, size: icCompareArrowsSize)))),
          Expanded(child: outputWidget)
        ]);
  }

  Widget _columnForPortraitOrientation() {
    return Column(children: <Widget>[
      inputWidget,
      Center(
          child: RotatedBox(
              quarterTurns: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: textColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.zero)),
                  child: InkWell(
                      highlightColor: colorHighlight,
                      splashColor: colorHighlightSplash,
                      borderRadius: BorderRadius.all(Radius.zero),
                      onTap: () {
                        String temp = inputWidget.getInputtedText();
                        inputWidget
                            .setTextToTextField(outputWidget.getInputtedText());
                        outputWidget.setTextToTextField(temp);
                      },
                      child: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.compare_arrows,
                              color: textColor, size: icCompareArrowsSize)))))),
      outputWidget
    ]);
  }
}
