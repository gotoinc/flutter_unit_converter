import 'package:unit_converter/vpr/view/base_view.dart';

abstract class UnitConverterView extends BaseView {
  void showUploader();
  void hideUploader();
  void setData(double data);
}