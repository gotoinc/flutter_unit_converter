import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;

List<Designation> _designations;

class InputSection extends StatelessWidget {
  DropdownBorder dropdownWidget;
  final Function(String) _inputEvent;
  final Function(Designation, String, bool) _selectEvent;

  final _textController = TextEditingController();
  var lastInputtedNumber = '0';

  InputSection(this._inputEvent, this._selectEvent, List<Designation> data, Designation selected) {
    _designations = data;
    dropdownWidget = DropdownBorder(Colors.textColor, Dimens.borderWidthDefault, Dimens.inputFieldRadius
        , (designation, refresh) => _selectEvent(designation, getInputtedText().isEmpty ? '0' : getInputtedText(), refresh)
        , selected);
    print('Create section. Where dropdown widget has ${dropdownWidget.hashCode} hash code');
  }

  void setData(List<Designation> data, Designation selected, bool refresh) {
    _designations = data;
    dropdownWidget.setData(data, selected, refresh);
  }

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
                  if(s.isEmpty) {
                    lastInputtedNumber = '0';
                    _inputEvent(lastInputtedNumber);
                    return;
                  }

                  if (!_isNumber(s)) setTextToTextField(lastInputtedNumber);
                  else {
                    lastInputtedNumber = s;
                    _inputEvent(s);
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

class DropdownBorder extends StatefulWidget {
  final Color borderColor;
  final double width;
  final double radius;
  final Function(Designation, bool) _selectEvent;
  Designation _selectedDesignation;

  _DropdownBorderState _state;

  DropdownBorder(this.borderColor, this.width, this.radius, this._selectEvent, this._selectedDesignation) {
    _state = _DropdownBorderState(borderColor, width, radius, _selectEvent, _selectedDesignation);
    _selectEvent(_selectedDesignation, true);
  }

  void setData(List<Designation> data, Designation selected, bool refresh) {
    _designations = data;
    _selectedDesignation = selected;
    _state._update(_selectedDesignation);
    _selectEvent(_selectedDesignation, refresh);
  }

  @override
  State<StatefulWidget> createState() {
    return _state;
  }
}

class _DropdownBorderState extends State<DropdownBorder> {
  final Color borderColor;
  final double width;
  final double radius;
  final Function(Designation, bool) _selectEvent;
  Designation _selectedDesignation;

  _DropdownBorderState(this.borderColor, this.width, this.radius, this._selectEvent, this._selectedDesignation);

  void _update(Designation d) {
    setState(() {
      _selectedDesignation = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _get(borderColor, width, radius),
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<Designation>(
                    style: Style.defaultTextStyle(),
                    value: _selectedDesignation,
                    items: _designations.map((Designation d) {
                      return DropdownMenuItem<Designation>(
                          value: d,
                          child: Container(
                              child: Text(
                                d.title,
                                softWrap: true,
                              )));
                    }).toList(),
                    isDense: false,
                    isExpanded: true,
                    onChanged: (Designation d) {
                      print('Designation was changed');
                      _selectEvent(d, true);
                      _update(d);
                    },
                    elevation: Dimens.dropDownUnitElevation,
                    iconSize: Dimens.icDropDownSize))));
  }

  BoxDecoration _get(Color borderColor, double width, double radius) {
    return BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: width,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
