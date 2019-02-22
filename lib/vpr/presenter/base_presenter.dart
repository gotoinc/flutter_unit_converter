import 'package:unit_converter/vpr/repository/currency.dart' as CurrencyRepository;
import 'package:unit_converter/vpr/repository/local.dart' as LocalRepository;

class BasePresenter {
  final CurrencyRepository.Api currencyApi;
  final LocalRepository.LocalData localData;

  BasePresenter()
      : currencyApi = CurrencyRepository.Api.getInstance(),
        localData = LocalRepository.LocalData.getInstance();
}