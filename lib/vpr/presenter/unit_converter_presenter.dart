import 'package:unit_converter/vpr/repository/local.dart';
import 'package:unit_converter/vpr/presenter/base_presenter.dart';
import 'package:unit_converter/vpr/view/unit_converter_view.dart';

class UnitConverterPresenter extends BasePresenter {
  UnitConverterView view;

  Unit selectedUnit;

  UnitConverterPresenter(this.view) : super() {
    selectedUnit = localData.units.elementAt(0);
  }

  void convert() {
    view.showUploader();
    currencyApi.getRate('', '').then((val) => view.setData(val));
  }
}