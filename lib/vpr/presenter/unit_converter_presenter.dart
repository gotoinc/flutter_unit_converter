import 'package:unit_converter/vpr/presenter/base_presenter.dart';
import 'package:unit_converter/vpr/view/unit_converter_view.dart';

class UnitConverterPresenter extends BasePresenter {
  UnitConverterView view;
  UnitConverterPresenter(this.view) : super();
  
  void convert() {
    view.showUploader();
    currencyApi.getRate('', '').then((val) => view.setData(val));
  }
}