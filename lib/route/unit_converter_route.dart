import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/route/categories_route.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/widget/converter.dart';

class UnitConverterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => (_navigateToCategories(context)),
              child: Icon(Icons.menu, color: textColor)),
          title: Text("Unit Converter".toUpperCase(),
              style: TextStyle(
                  fontSize: textSize3,
                  color: textColor,
                  fontWeight: FontWeight.normal)),
          centerTitle: true,
          elevation: 0,
        ),
        body: ConverterGroup());
  }

  void _navigateToCategories(BuildContext context) async {
    final Field result = await Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CategoriesScreen())));
    if(result != null)
      print("Returned value: " + result.title);
  }
}
