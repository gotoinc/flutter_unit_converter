import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/style/style.dart';
import 'package:unit_converter/widget/dropdown_border.dart';

class InputSection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  String getInputtedText() {
    return _textController.text;
  }

  void setTextToTextField(String newText) {
    _textController.text = newText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            style: defaultTextStyle(),
            controller: _textController,
            decoration: InputDecoration(
                hintText: "Value",
                labelText: "Input Value",
                labelStyle: defaultLabelTextStyle(),
                hintStyle: defaultHintTextStyle(),
                contentPadding: EdgeInsets.all(defaultPadding),
                border: _get(borderWidthDefault, textColor),
                enabledBorder:
                    _get(borderWidthDefault, textColor),
                focusedBorder:
                    _get(borderWidthFocused, textColor),
                disabledBorder: _get(
                    borderWidthDefault, textColorDisabled)),
          ),
          SizedBox(height: defaultPadding),
          DropdownBorder(borderColor: textColor, width: borderWidthDefault, radius: inputFieldRadius)
        ]));
  }

  OutlineInputBorder _get(double borderWidth, Color borderColor) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputFieldRadius),
        borderSide: BorderSide(color: borderColor, width: borderWidth));
  }
}
