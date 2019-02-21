import 'package:unit_converter/vpr/repository/currency.dart' as CurrencyRepository;
import 'package:unit_converter/vpr/view/base_view.dart';

class BasePresenter {
  final CurrencyRepository.Api currencyApi;

  BasePresenter()
      : currencyApi = CurrencyRepository.Api.getInstance();
}