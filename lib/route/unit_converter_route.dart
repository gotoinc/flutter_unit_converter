import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/route/categories_route.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/widget/converter.dart';

String appBarTitle = "Unit Converter";

class UnitConverterScreen extends StatelessWidget {
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
        body: ConverterGroup());
  }

  void _navigateToCategories(BuildContext context) async {
    final Field result = await Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CategoriesScreen())));
    if(result != null)
      appBarTitle = result.title;
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
        style: TextStyle(
            fontSize: textSize3,
            color: textColor,
            fontWeight: FontWeight.normal));
  }

}
