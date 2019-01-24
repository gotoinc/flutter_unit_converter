import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/route/categories_route.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/style.dart';
import 'package:unit_converter/widget/converter.dart';

Unit selectedUnit = getUnits().elementAt(0);
String appBarTitle = selectedUnit.name;

class UnitConverterScreen extends StatelessWidget {
  final _body = UnitConverterGroup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => (_navigateToCategories(context)),
              child: Icon(Icons.menu, color: textColor)),
          title: _AppBarTitle(),
          centerTitle: true,
          elevation: 0,
        ),
        body: _body);
  }

  void _navigateToCategories(BuildContext context) async {
    selectedUnit = await Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CategoriesScreen())));
    _body.set(selectedUnit.designations);
  }
}

class _AppBarTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppBarTitleState();
  }
}

class _AppBarTitleState extends State<_AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(appBarTitle.toUpperCase(),
        style: appBarTitleTextStyle());
  }

}
