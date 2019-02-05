import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;
import 'package:unit_converter/widget/dropdown_border.dart';

List<Designation> _designations;
class InputSection extends StatelessWidget {
  DropdownBorder dropdownWidget;
  Function(String, bool) inputEvent;

  final bool isInput;
  final _textController = TextEditingController();
  var lastInputtedNumber = "";

  InputSection(this.isInput, List<Designation> data, this.inputEvent) {
    _designations = data;
    print("Designation21: " + _designations.elementAt(0).toString());
    dropdownWidget = DropdownBorder(
        borderColor: Colors.textColor,
        width: Dimens.borderWidthDefault,
        radius: Dimens.inputFieldRadius,
        data: _designations);
  }

  void setData(List<Designation> data) {
    _designations = data;
    print("Designation22: " + _designations.elementAt(0).toString());
    dropdownWidget.setData(data);
  }

  String getInputtedText() {
    return _textController.text;
  }

  void setTextToTextField(String newText) {
    print('Set text to $isInput => $newText');
    _textController.text = newText;
    _textController.selection = TextSelection.collapsed(offset: newText.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(Dimens.defaultPadding),
            child: Column(children: <Widget>[
              TextField(
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                textInputAction: TextInputAction.done,
                style: Style.defaultTextStyle(),
                controller: _textController,
                onChanged: (s) {
                  if(s.isEmpty) {
                    lastInputtedNumber = '';
                    inputEvent('0', isInput);
                    return;
                  }

                  if (!_isNumber(s)) setTextToTextField(lastInputtedNumber);
                  else {
                    lastInputtedNumber = s;
                    inputEvent(s, isInput);
                  }
                },
                decoration: InputDecoration(
                    hintText: "Value",
                    labelText: "Input Value",
                    labelStyle: Style.defaultLabelTextStyle(),
                    hintStyle: Style.defaultHintTextStyle(),
                    contentPadding: EdgeInsets.all(Dimens.defaultPadding),
                    border: _get(Dimens.borderWidthDefault, Colors.textColor),
                    enabledBorder: _get(Dimens.borderWidthDefault, Colors.textColor),
                    focusedBorder: _get(Dimens.borderWidthFocused, Colors.textColor),
                    disabledBorder:
                    _get(Dimens.borderWidthDefault, Colors.textColor['disabled'])),
              ),
              SizedBox(height: Dimens.defaultPadding),
              dropdownWidget
            ])));
  }

  OutlineInputBorder _get(double borderWidth, Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.inputFieldRadius),
        borderSide: BorderSide(color: borderColor, width: borderWidth));
  }

  bool _isNumber(String s) {
    if (s == null) return false;
    return double.tryParse(s) == null ? false : true;
  }
}
