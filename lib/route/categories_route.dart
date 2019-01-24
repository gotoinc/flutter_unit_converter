import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/style.dart';
import 'package:unit_converter/widget/categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => (_navigateBack(context)),
              child: Icon(Icons.arrow_back, color: textColor)),
          title: Text('Choose category'.toUpperCase(),
              style: appBarTitleTextStyle()),
          centerTitle: true,
          elevation: 0,
        ),
        body: CategoriesGroup());
  }

  void _navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}