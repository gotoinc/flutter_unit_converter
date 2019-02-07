import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/widget/input_section.dart';

List<Designation> _designations;
Designation inputDesignation;
Designation outputDesignation;

calculateResult(bool isInput, num inputtedValue) {
  String result = '';
  if(inputtedValue != 0)
    isInput ? inputDesignation.conversion.forEach((key, f) => key == outputDesignation.title ? result = f(inputtedValue).toStringAsFixed(2) : '')
        : outputDesignation.conversion.forEach((key, f) => key == inputDesignation.title ? result = f(inputtedValue).toStringsAsFixed(2) : '');
  print('Result: $result');
  return result;
}

class UnitConverterGroup extends StatelessWidget {
  InputSection inputWidget;
  InputSection outputWidget;

  UnitConverterGroup(List<Designation> data) {
    _designations = data;
    inputDesignation = _designations.elementAt(0);
    outputDesignation = _designations.elementAt(1);

    inputWidget = InputSection((newText) {
        print('Input text: $newText');
        outputWidget.setTextToTextField(calculateResult(true, num.parse(newText)));
      }
      , (d, currentText, refresh) {
        print('Input designation: $currentText - ${d.title} - $refresh');
          inputDesignation = d;
          if(refresh)
            outputWidget.setTextToTextField(calculateResult(true, num.parse(currentText)));
      }
      , _designations, inputDesignation);
    outputWidget = InputSection((newText) {
      inputWidget.setTextToTextField(calculateResult(false, num.parse(newText)));
    }, (d, currentText, refresh) {
      print('Output designation: $currentText - ${d.title} - $refresh');
      outputDesignation = d;
      if(refresh)
        inputWidget.setTextToTextField(calculateResult(false, num.parse(currentText)));
    }, _designations, outputDesignation);
  }

  void setData(List<Designation> data) {
    _designations = data;
    inputWidget.setData(data, data.elementAt(0), false);
    outputWidget.setData(data, data.elementAt(1), false);
    inputWidget.triggerInputEvent();
    print('Data was changed');
  }

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
                    color: Colors.textColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.zero)),
              child: InkWell(
                  borderRadius: BorderRadius.all(Radius.zero),
                  onTap: () {
                    String temp = inputWidget.getInputtedText();
                    inputWidget.setTextToTextField(outputWidget.getInputtedText());
                    outputWidget.setTextToTextField(temp);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(Dimens.defaultPadding),
                      child: Icon(Icons.compare_arrows,
                          color: Colors.textColor, size: Dimens.icCompareArrowsSize)))),
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
                        color: Colors.textColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.zero)),
                  child: InkWell(
                      highlightColor: Colors.colorHighlight,
                      splashColor: Colors.colorHighlightSplash,
                      borderRadius: BorderRadius.all(Radius.zero),
                      onTap: () {
                        String temp = inputWidget.getInputtedText();
                        inputWidget.setTextToTextField(outputWidget.getInputtedText());
                        outputWidget.setTextToTextField(temp);
                        inputWidget.triggerInputEvent();
                      },
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.defaultPadding),
                          child: Icon(Icons.compare_arrows,
                              color: Colors.textColor, size: Dimens.icCompareArrowsSize)))))),
      outputWidget
    ]);
  }
}