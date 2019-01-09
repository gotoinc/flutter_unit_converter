import 'package:flutter/material.dart';
import 'package:unit_converter/style/style.dart';

class Unit {
  const Unit(this.id, this.name);

  final int id;
  final String name;
}

List<Unit> units = <Unit>[const Unit(1, "Unit 1"), const Unit(2, "Unit 2"), const Unit(3, "Unit 3"), const Unit(4, "Unit 4")];

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

  Unit _selectedUnit = units.elementAt(0);

  _DropdownBorderState(this.borderColor, this.width, this.radius);

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
                        items: units.map((Unit unit) {
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
