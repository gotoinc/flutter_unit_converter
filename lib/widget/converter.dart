import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/widget/input_section.dart';

List<Designation> _designations;
class UnitConverterGroup extends StatelessWidget {
  InputSection inputWidget;
  InputSection outputWidget;

  UnitConverterGroup(List<Designation> data) {
    _designations = data;
    print("Designation11: " + _designations.elementAt(0).toString());
    inputWidget = InputSection(true, _designations, (newText, inInput) {
        print('Input: $newText');
        outputWidget.setTextToTextField(from_m_to_cm(num.parse(newText)).toStringAsFixed(2));
    });
    outputWidget = InputSection(false, _designations, (newText, inInput) {
        print('Output: $newText');
        inputWidget.setTextToTextField(from_cm_to_m(num.parse(newText)).toStringAsFixed(2));
    });
  }

  void setData(List<Designation> data) {
    _designations = data;
    print("Designation12: " + _designations.elementAt(0).toString());
    inputWidget.setData(data);
    outputWidget.setData(data);
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
                      },
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.defaultPadding),
                          child: Icon(Icons.compare_arrows,
                              color: Colors.textColor, size: Dimens.icCompareArrowsSize)))))),
      outputWidget
    ]);
  }
}