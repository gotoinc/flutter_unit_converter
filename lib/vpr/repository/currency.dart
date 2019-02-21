import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

class Api {
  final _httpClient = HttpClient();
  final _baseUrl = 'api.exchangeratesapi.io';
  final _getCurrencies = '/latest';

  static Api _instance;

  static Api getInstance() {
    if(_instance == null) return Api();
    else return _instance;
  }

  Future<double> getRate(final String currencyBase, final String currencyTo) =>
      _getRate(_httpClient, _baseUrl, _getCurrencies, currencyBase, currencyTo);
}

Future<double> _getRate(HttpClient client
    , String baseUrl, String path
    , String currencyBase, String currencyTo) async {
  final uri = Uri.https(baseUrl, path, {'base': currencyBase, 'symbols': currencyTo});
  final request = await client.getUrl(uri);
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  if(response.statusCode != 200) return 0;
  else return CurrencyApiResponse.fromJson(json.decode(body)).rates.values.elementAt(0);
}

class CurrencyApiResponse {
  final String baseCurrency;
  final String date;
  final Map<String, dynamic> rates;

  CurrencyApiResponse(this.baseCurrency, this.date, this.rates);

  CurrencyApiResponse.fromJson(Map<String, dynamic> json)
      : baseCurrency = json['base'],
        date = json['date'],
        rates = json['rates'];
}