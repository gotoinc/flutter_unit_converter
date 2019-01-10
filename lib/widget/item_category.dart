import 'package:flutter/material.dart';
import 'package:unit_converter/data/data.dart';
import 'package:unit_converter/style/style.dart';

class ItemCategory extends StatelessWidget {
  final Field field;

  const ItemCategory({Key key, this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
                highlightColor: Colors.greenAccent.shade400,
                splashColor: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                onTap: () {Navigator.of(context).pop(field);},
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: <Widget>[
                      Icon(Icons.backup, color: Colors.white, size: 48),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(field.title,
                                  style: defaultTextStyle(),
                                  textAlign: TextAlign.center)))
                    ])))));
  }
}
