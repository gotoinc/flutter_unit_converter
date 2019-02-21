import 'package:flutter/material.dart';
import 'package:unit_converter/vpr/presenter/unit_converter_presenter.dart';
import 'package:unit_converter/vpr/view/unit_converter_view.dart';

class UnitConverterScreen extends StatefulWidget implements UnitConverterView {
  _UnitConverterScreenState state;
  final presenter = UnitConverterPresenter(this);

  @override
  State<StatefulWidget> createState() {
    state = _UnitConverterScreenState();
    return state;
  }

  @override
  void showUploader() {
    // TODO: implement displayUploader
  }

  @override
  void hideUploader() {
    // TODO: implement hideUploader
  }

  @override
  void setData(double data) {
    // TODO: implement setData
  }
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}