import 'dart:math';

class Unit {
  const Unit(this.id, this.name);

  final int id;
  final String name;
}

List<Unit> getUnits() {
  List<Unit> units = List();
  final int size = _generateRandomListSize();
  for (var i = 0; i < size; i++) {
    units.add(Unit(i + 1, "Unit $i"));
  }

  return units;
}

class Field {
  const Field(this.id, this.title);

  final int id;
  final String title;
}

List<Field> getFields() {
  List<Field> fields = List();
  final int size = _generateRandomListSize();
  for (var i = 0; i < size; i++) {
    fields.add(Field(i + 1, "Field $i"));
  }

  return fields;
}

int _generateRandomListSize() {
  final Random _random = Random();
  final int randomValue = 2 + _random.nextInt(20 - 2);
  print("Random value: $randomValue");
  return randomValue;
}
