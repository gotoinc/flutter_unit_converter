import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;
import 'package:unit_converter/widget/input_section.dart';

List<Designation> _designations;
Designation inputDesignation;
Designation outputDesignation;

calculateResult(bool isInput, num inputtedValue) {
  String result = '';
  if (inputtedValue != 0)
    isInput
        ? inputDesignation.conversion.forEach((key, f) =>
    key == outputDesignation.title
        ? result = f(inputtedValue).toStringAsFixed(2)
        : '')
        : outputDesignation.conversion.forEach((key, f) =>
    key == inputDesignation.title
        ? result = f(inputtedValue).toStringAsFixed(2)
        : '');
  print('Result: $result');
  return result;
}

class UnitConverterGroup extends StatelessWidget {
  InputSection inputWidget;
  InputSection outputWidget;
  ChangeButton changeButton;

  UnitConverterGroup(List<Designation> data) {
    _designations = data;
    if (_designations != null) {
      inputDesignation = _designations.elementAt(0);
      outputDesignation = _designations.elementAt(1);
    }

    inputWidget = InputSection((newText) {
      print('Input text: $newText');
      if(inputDesignation.conversion != null) {
        outputWidget
            .setTextToTextField(calculateResult(true, num.parse(newText)));
      } else {
        Api.getInstance().getRate(inputDesignation.title, outputDesignation.title).then((rate) =>
            outputWidget.setTextToTextField((num.parse(newText) * rate).toStringAsFixed(2)));
      }
    }, (d, currentText, refresh) {
      print('Input designation: $currentText - ${d != null ? d.title : null} - $refresh');
      inputDesignation = d;
      if (refresh)
        if(inputDesignation.conversion != null) {
          outputWidget
              .setTextToTextField(
              calculateResult(true, num.parse(currentText)));
        } else {
          Api.getInstance().getRate(inputDesignation.title, outputDesignation.title).then((rate) =>
              outputWidget.setTextToTextField((num.parse(currentText) * rate).toStringAsFixed(2)));
        }
    }, _designations, inputDesignation);
    outputWidget = InputSection((newText) {
      print('Output text: $newText');
      if(outputDesignation.conversion != null) {
        inputWidget.setTextToTextField(calculateResult(false, num.parse(newText)));
      } else {
        Api.getInstance().getRate(outputDesignation.title, inputDesignation.title).then((rate) =>
            inputWidget.setTextToTextField((num.parse(newText) * rate).toStringAsFixed(2)));
      }
    }, (d, currentText, refresh) {
      print('Output designation: $currentText - ${d != null ? d.title : null} - $refresh');
      outputDesignation = d;
      if (refresh)
        if(outputDesignation.conversion != null) {
          inputWidget.setTextToTextField(calculateResult(false, num.parse(currentText)));
        } else {
          Api.getInstance().getRate(outputDesignation.title, inputDesignation.title).then((rate) =>
              inputWidget.setTextToTextField((num.parse(currentText) * rate).toStringAsFixed(2)));
        }
    }, _designations, outputDesignation);
    changeButton = ChangeButton(false);
  }

  void setData(List<Designation> data) {
    _designations = data;
    changeButton.isLoading = false;
    inputWidget.setData(data, data.elementAt(0), false);
    outputWidget.setData(data, data.elementAt(1), false);
    inputWidget.triggerInputEvent();
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
                    inputWidget
                        .setTextToTextField(outputWidget.getInputtedText());
                    inputWidget.triggerInputEvent();
                  },
                  child: Padding(
                      padding: EdgeInsets.all(Dimens.defaultPadding),
                      child: Icon(Icons.compare_arrows,
                          color: Colors.textColor,
                          size: Dimens.icCompareArrowsSize)))),
          Expanded(child: outputWidget)
        ]);
  }

  Widget _columnForPortraitOrientation() {
    return Column(children: <Widget>[
      inputWidget,
      Center(child: changeButton),
      outputWidget
    ]);
  }
}

class ChangeButton extends StatefulWidget {
  bool _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    _state._update(_isLoading);
  }

  ChangeButton(this._isLoading);

  _ChangeButtonState _state;

  @override
  State<StatefulWidget> createState() {
    print('Create state of \"Change button\"');
    _state = _ChangeButtonState(_isLoading);
    return _state;
  }
}

class _ChangeButtonState extends State<ChangeButton> {
  bool _isLoading;

  _ChangeButtonState(this._isLoading);

  void _update(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Text("Uploading info...", style: Style.defaultHintTextStyle()) : RotatedBox(
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
//                  String temp = inputWidget.getInputtedText();
//                  inputWidget.setTextToTextField(outputWidget.getInputtedText());
//                  outputWidget.setTextToTextField(temp);
//                  inputWidget.triggerInputEvent();
                },
                child: Padding(
                    padding: EdgeInsets.all(Dimens.defaultPadding),
                    child: Icon(Icons.compare_arrows,
                        color: Colors.textColor,
                        size: Dimens.icCompareArrowsSize)))));
  }
}
