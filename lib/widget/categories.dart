import 'package:flutter/material.dart';
import 'package:unit_converter/data/data.dart';
import 'package:unit_converter/widget/item_category.dart';

class CategoriesGroup extends StatelessWidget {
  final List<Field> _fields = getFields();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final double childAspectRatio = MediaQuery.of(context).size.height / 80;
      print("Child aspect ratio: $childAspectRatio");
      return _getRootWidget(childAspectRatio, orientation);
    });
  }

  Widget _getRootWidget(double childAspectRatio, Orientation orientation) {
    return orientation == Orientation.landscape
        ? GridView.builder(
            itemCount: _fields.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: childAspectRatio, crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ItemCategory(field: _fields.elementAt(index));
            })
        : ListView.builder(
            itemCount: _fields.length,
            itemBuilder: (BuildContext context, int position) {
              return ItemCategory(field: _fields.elementAt(position));
            });
  }
}
