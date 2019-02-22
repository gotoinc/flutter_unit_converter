import 'package:flutter/material.dart';
import 'package:unit_converter/route/categories_route.dart';
import 'package:unit_converter/route/unit_converter_route.dart';
import 'package:unit_converter/style/consts/colors.dart' as Colors;
import 'package:unit_converter/style/style.dart' as Style;
import 'package:unit_converter/vpr/presenter/unit_converter_presenter.dart';
import 'package:unit_converter/vpr/view/unit_converter_view.dart';
import 'package:unit_converter/widget/converter.dart';

UnitConverterPresenter _presenter;
String _appBarTitle;

class UnitConverterScreen extends StatelessWidget implements UnitConverterView {
  final _body = UnitConverterGroup(selectedUnit.designations);

  UnitConverterScreen() {
    _presenter = new UnitConverterPresenter(this);
    _appBarTitle = _presenter.selectedUnit.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => (_navigateToCategories(context)),
              child: Icon(Icons.menu, color: Colors.textColor)),
          title: _AppBarTitle(),
          centerTitle: true,
          elevation: 0,
        ),
        body: _body);
  }

  void _navigateToCategories(BuildContext context) async {
    _presenter.selectedUnit = await Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CategoriesScreen())));
    _body.setData(selectedUnit.designations);
    _appBarTitle = selectedUnit.name;
    print('App bar title: $_appBarTitle');
  }

  @override
  void showUploader() {
    print('Show uploader');
  }

  @override
  void hideUploader() {
    print('Hide uploader');
  }

  @override
  void setData(double data) {
    print('Set: $data');
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
    return Text(_appBarTitle.toUpperCase(),
        style: Style.appBarTitleTextStyle());
  }
}