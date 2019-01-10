import 'package:flutter/material.dart';
import 'package:unit_converter/data/data.dart';
import 'package:unit_converter/widget/item_category.dart';

class CategoriesGroup extends StatelessWidget {
  final List<Field> _fields = getFields();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _fields.length,
        itemBuilder: (BuildContext context, int position) {
          return ItemCategory(field: _fields.elementAt(position));
        });
  }
}
