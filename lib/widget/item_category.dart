import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/style/style.dart';

class ItemCategory extends StatelessWidget {
  final Unit unit;

  const ItemCategory({Key key, this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IntrinsicHeight(child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: listItemSpace),
            child: InkWell(
                highlightColor: colorHighlight,
                splashColor: colorHighlightSplash,
                borderRadius:
                    BorderRadius.all(Radius.circular(listItemPressRadius)),
                onTap: () {
                  Navigator.of(context).pop(unit);
                },
                child: Padding(
                    padding: EdgeInsets.all(listItemPadding),
                    child: Row(children: <Widget>[
                      Icon(Icons.backspace,
                          color: textColor, size: icCategorySize),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: Text(unit.name,
                                  style: defaultTextStyle(),
                                  textAlign: TextAlign.center)))
                    ]))))));
  }
}
