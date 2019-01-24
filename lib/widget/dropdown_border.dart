import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/style/style.dart';

class DropdownBorder extends StatefulWidget {
  final List<Designation> designations;
  final Color borderColor;
  final double width;
  final double radius;

  const DropdownBorder({Key key, this.borderColor, this.width, this.radius, @required this.designations})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DropdownBorderState(borderColor, width, radius, designations);
  }
}

class _DropdownBorderState extends State<DropdownBorder> {
  final List<Designation> designations;
  final Color borderColor;
  final double width;
  final double radius;

  Designation _selectedDesignation;

  _DropdownBorderState(this.borderColor, this.width, this.radius, this.designations) {
    this._selectedDesignation = designations.elementAt(0);
  }

  void _update(Designation designation) {
    setState(() {
      _selectedDesignation = designation;
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
                    style: defaultTextStyle(),
                    value: _selectedDesignation,
                    items: designations.map((Designation d) {
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
                    elevation: dropDownUnitElevation,
                    iconSize: icDropDownSize))));
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
