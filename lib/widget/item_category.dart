import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/data.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/consts/dimensions.dart' as Dimens;
import 'package:unit_converter/style/style.dart' as Style;

class ItemCategory extends StatelessWidget {
  final Unit unit;

  const ItemCategory({Key key, this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IntrinsicHeight(child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.listItemSpace),
            child: InkWell(
                highlightColor: Colors.colorHighlight,
                splashColor: Colors.colorHighlightSplash,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.listItemPressRadius)),
                onTap: () {
                  Navigator.of(context).pop(unit);
                },
                child: Padding(
                    padding: EdgeInsets.all(Dimens.listItemPadding),
                    child: Row(children: <Widget>[
                      Icon(unit.icon,
                          color: Colors.textColor, size: Dimens.icCategorySize),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.defaultPadding),
                              child: Text(unit.name,
                                  style: Style.defaultTextStyle(),
                                  textAlign: TextAlign.center)))
                    ]))))));
  }
}
