import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/widget/input_section.dart';

class UnitConverterGroup extends StatefulWidget {
  _UnitConverterGroupState _state;
  set data(List<Designation> designations) =>_state.data = designations;

  UnitConverterGroup(List<Designation> designations) {
    _state = _UnitConverterGroupState(designations);
  }

  @override
  State<StatefulWidget> createState() {
    return _state;
  }
}

class _UnitConverterGroupState extends State<UnitConverterGroup> {
  List<Designation> _designations;
  set data(List<Designation> designations) {
    _designations = designations;
    setState(() {
      inputWidget.data = designations;
      outputWidget.data = designations;
    });
  }

  InputSection inputWidget;
  InputSection outputWidget;

  _UnitConverterGroupState(this._designations) {
    inputWidget = InputSection(_designations);
    outputWidget = InputSection(_designations);
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
                    String temp = inputWidget.inputtedText();
                    inputWidget.textToTextField = outputWidget.inputtedText();
                    outputWidget.textToTextField = temp;
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
                        String temp = inputWidget.inputtedText();
                        inputWidget.textToTextField = outputWidget.inputtedText();
                        outputWidget.textToTextField = temp;
                      },
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.defaultPadding),
                          child: Icon(Icons.compare_arrows,
                              color: Colors.textColor, size: Dimens.icCompareArrowsSize)))))),
      outputWidget
    ]);
  }
}
