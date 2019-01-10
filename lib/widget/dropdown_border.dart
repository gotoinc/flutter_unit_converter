import 'package:flutter/material.dart';
import 'package:unit_converter/data/data.dart';
import 'package:unit_converter/style/style.dart';

BoxDecoration _get(Color borderColor, double width, double radius) {
  return BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: width,
      ),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

class DropdownBorder extends StatefulWidget {
  final Color borderColor;
  final double width;
  final double radius;

  const DropdownBorder({Key key, this.borderColor, this.width, this.radius})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DropdownBorderState(borderColor, width, radius);
  }
}

class _DropdownBorderState extends State<DropdownBorder> {
  final Color borderColor;
  final double width;
  final double radius;

  final List<Unit> _units = getUnits();
  Unit _selectedUnit;

  _DropdownBorderState(this.borderColor, this.width, this.radius) {
    this._selectedUnit = _units.elementAt(0);
  }

  void _update(Unit unit) {
    setState(() {
      _selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _get(borderColor, width, radius),
        child: Theme(
            data: ThemeData(
                canvasColor: Colors.greenAccent.shade400,
                brightness: Brightness.dark),
            child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<Unit>(
                        style: defaultTextStyle(),
                        value: _selectedUnit,
                        items: _units.map((Unit unit) {
                          return DropdownMenuItem<Unit>(
                              value: unit,
                              child: Container(
                                  child: Text(
                                unit.name,
                                softWrap: true,
                              )));
                        }).toList(),
                        isDense: false,
                        isExpanded: true,
                        onChanged: (Unit unit) {
                          _update(unit);
                        },
                        elevation: 16,
                        iconSize: 44)))));
  }
}
