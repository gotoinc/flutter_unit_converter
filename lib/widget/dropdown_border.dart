import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;

List<Designation> _designations;
Designation _selectedDesignation;
class DropdownBorder extends StatefulWidget {
  _DropdownBorderState _state;

  final Color borderColor;
  final double width;
  final double radius;

  DropdownBorder({this.borderColor, this.width, this.radius, @required List<Designation> data}) {
    _designations = data;
    print("Designation31: " + _designations.elementAt(0).toString());
    _state = _DropdownBorderState(borderColor, width, radius);
    _selectedDesignation = _designations.elementAt(0);
  }

  void setData(List<Designation> data) {
    _designations = data;
    print("Designation32: " + _designations.elementAt(0).toString());
    _state._update(_designations.elementAt(0));
    _selectedDesignation = _designations.elementAt(0);
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

  _DropdownBorderState(this.borderColor, this.width, this.radius);

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
