import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;
import 'package:unit_converter/widget/dropdown_border.dart';

class InputSection extends StatefulWidget {
  _InputSectionState _state;
  set data(List<Designation> designations) => _state.data = designations;

  InputSection(List<Designation> designations) {
    _state = _InputSectionState(designations);
  }

  get inputtedText => _state.getInputtedText();
  set textToTextField(String s) => _state.setTextToTextField(s);

  @override
  State<StatefulWidget> createState() {
    return _state;
  }
}

class _InputSectionState extends State<InputSection> {
  final _textController = TextEditingController();
  var lastInputtedNumber = "";
  List<Designation> _designations;
  set data(List<Designation> designations) {
    print('input section set state: ${designations.elementAt(0).toString()}');
    setState(() => _designations = designations);
  }

  _InputSectionState(this._designations);

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
            padding: EdgeInsets.all(Dimens.defaultPadding),
            child: Column(children: <Widget>[
              TextField(
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                textInputAction: TextInputAction.done,
                style: Style.defaultTextStyle(),
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
              DropdownBorder(
                  borderColor: Colors.textColor,
                  width: Dimens.borderWidthDefault,
                  radius: Dimens.inputFieldRadius,
                  designations: _designations)
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
