import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/style/style.dart';
import 'package:unit_converter/widget/dropdown_border.dart';

class InputSection extends StatelessWidget {
  final _textController = TextEditingController();
  var lastInputtedNumber = "";

  String getInputtedText() {
    return _textController.text;
  }

  void setTextToTextField(String newText) {
    _textController.text = newText;
    _textController.selection = TextSelection.collapsed(offset: newText.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(children: <Widget>[
              TextField(
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                textInputAction: TextInputAction.done,
                style: defaultTextStyle(),
                controller: _textController,
                onChanged: (s) {
                  if (!_isNumber(s))
                    setTextToTextField(lastInputtedNumber);
                  else
                    lastInputtedNumber = s;
                },
                decoration: InputDecoration(
                    hintText: "Value",
                    labelText: "Input Value",
                    labelStyle: defaultLabelTextStyle(),
                    hintStyle: defaultHintTextStyle(),
                    contentPadding: EdgeInsets.all(defaultPadding),
                    border: _get(borderWidthDefault, textColor),
                    enabledBorder: _get(borderWidthDefault, textColor),
                    focusedBorder: _get(borderWidthFocused, textColor),
                    disabledBorder:
                        _get(borderWidthDefault, textColor['disabled'])),
              ),
              SizedBox(height: defaultPadding),
              DropdownBorder(
                  borderColor: textColor,
                  width: borderWidthDefault,
                  radius: inputFieldRadius)
            ])));
  }

  OutlineInputBorder _get(double borderWidth, Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputFieldRadius),
        borderSide: BorderSide(color: borderColor, width: borderWidth));
  }

  bool _isNumber(String s) {
    if (s == null) return false;
    return double.tryParse(s) == null ? false : true;
  }
}
