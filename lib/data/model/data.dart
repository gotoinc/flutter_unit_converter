import 'package:flutter/material.dart';

class Unit {
  const Unit(this.id, this.name, this.color, this.icon, this.designations);

  final int id;
  final String name;
  final Color color;
  final IconData icon;
  final List<Designation> designations;
}

class Designation {
  const Designation(this.id, this.title);

  final int id;
  final String title;

  @override
  String toString() {
    return '$id - $title';
  }
}

List<Unit> getUnits() {
  List<Unit> units = List();
  List<Designation> lengthDesignations = List();
  lengthDesignations.add(Designation(1, "cm"));
  lengthDesignations.add(Designation(2, "m"));
  lengthDesignations.add(Designation(3, "km"));
  List<Designation> weightDesignations = List();
  weightDesignations.add(Designation(1, "gr"));
  weightDesignations.add(Designation(2, "kg"));
  weightDesignations.add(Designation(3, "cwt"));
  List<Designation> timeDesignations = List();
  timeDesignations.add(Designation(1, "sec"));
  timeDesignations.add(Designation(2, "min"));
  timeDesignations.add(Designation(3, "h"));
  List<Designation> volumeDesignations = List();
  volumeDesignations.add(Designation(1, "ml"));
  volumeDesignations.add(Designation(2, "L"));
  units.add(Unit(1, "Length", Colors.blue, Icons.looks_one, lengthDesignations));
  units.add(Unit(2, "Weight", Colors.blue, Icons.looks_two, weightDesignations));
  units.add(Unit(3, "Time", Colors.blue, Icons.looks_3, timeDesignations));
  units.add(Unit(4, "Volume", Colors.blue, Icons.looks_4, volumeDesignations));

  return units;
}
