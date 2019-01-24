import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/widget/item_category.dart';

class CategoriesGroup extends StatelessWidget {
  final List<Unit> _units = getUnits();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final double childAspectRatio = MediaQuery.of(context).size.height / 80;
      return _getRootWidget(childAspectRatio, orientation);
    });
  }

  Widget _getRootWidget(double childAspectRatio, Orientation orientation) {
    return orientation == Orientation.landscape
        ? GridView.builder(
            itemCount: _units.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: childAspectRatio, crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ItemCategory(unit: _units.elementAt(index));
            })
        : ListView.builder(
            itemCount: _units.length,
            itemBuilder: (BuildContext context, int position) {
              return ItemCategory(unit: _units.elementAt(position));
            });
  }
}
