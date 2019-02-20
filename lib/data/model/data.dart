import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

class Api {
  final _httpClient = HttpClient();
  final _url = 'api.exchangeratesapi.io';
  final _get_currencies = '/latest';

  static Api _instance = null;

  static Api getInstance() {
    if(_instance == null) return Api();
    else return _instance;
  }

  Future<double> getRate(String from, String to) => _getRate(_httpClient, _url, _get_currencies, from, to);
}

Future<double> _getRate(HttpClient client, String url, String get_currencies, String from, String to) async {
  final uri = Uri.https(url, get_currencies, {'base': from, 'symbols': to});
  print('Uri: $uri');
  final request = await client.getUrl(uri);
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  if(response.statusCode != 200) return 0;
  else {
    final CurrencyApiResponse apiResponse = CurrencyApiResponse.fromJson(json.decode(body));
    print('Currency API rate: ${apiResponse.rates.values.elementAt(0)}');
    return apiResponse.rates.values.elementAt(0);
  }
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

class Unit {
  final int id;
  final String name;
  final Color color;
  final String icon;
  final List<Designation> designations;
  final isLocal;

  const Unit(this.id, this.name, this.color, this.icon, this.designations, this.isLocal);
}

class Designation {
  final int id;
  final String title;
  final Map<String, Function> conversion;

  const Designation(this.id, this.title, this.conversion);

  @override
  String toString() {
    return '$id - $title';
  }
}

List<Unit> getUnits() {
  List<Unit> units = List();
  List<Designation> lengthDesignations = List();
  lengthDesignations.add(Designation(1, 'cm', {'cm': ((cm) => cm), 'm': ((cm) => cm / 100), 'km': ((cm) => cm / 100 / 1000)}));
  lengthDesignations.add(Designation(2, 'm', {'cm': ((m) => m * 100), 'm': ((m) => m), 'km': ((m) => m / 1000)}));
  lengthDesignations.add(Designation(3, 'km', {'cm': ((km) => km * 1000 * 100), 'm': ((km) => km * 1000), 'km': ((km) => km)}));
  List<Designation> weightDesignations = List();
  weightDesignations.add(Designation(1, 'gr', {'gr': ((gr) => gr), 'kg': ((gr) => gr / 1000), 'cwt': ((cwt) => cwt / 1000 / 100)}));
  weightDesignations.add(Designation(2, 'kg', {'gr': ((kg) => kg * 1000), 'kg': ((kg) => kg), 'cwt': ((kg) => kg / 100)}));
  weightDesignations.add(Designation(3, 'cwt', {'gr': ((cwt) => cwt * 1000 * 100), 'kg': ((cwt) => cwt * 100), 'cwt': ((cwt) => cwt)}));
  List<Designation> timeDesignations = List();
  timeDesignations.add(Designation(1, 'sec', {'sec': ((sec) => sec), 'min': ((sec) => sec / 60), 'h': ((sec) => sec / 60 / 60)}));
  timeDesignations.add(Designation(2, 'min', {'sec': ((min) => min * 60), 'min': ((min) => min), 'h': ((min) => min / 60)}));
  timeDesignations.add(Designation(3, 'h', {'sec': ((h) => h * 60 * 60), 'min': ((h) => h * 60), 'h': ((h) => h)}));
  List<Designation> volumeDesignations = List();
  volumeDesignations.add(Designation(1, 'ml', {'ml': ((ml) => ml), 'L': ((ml) => ml / 1000)}));
  volumeDesignations.add(Designation(2, 'L', {'ml': ((l) => l * 1000), 'L': ((l) => l)}));
  List<Designation> currencyDesignations = List();
  currencyDesignations.add(Designation(1, "USD", null));
  currencyDesignations.add(Designation(2, "EUR", null));
  currencyDesignations.add(Designation(3, "GBP", null));
  currencyDesignations.add(Designation(4, "RUB", null));

  units.add(Unit(1, 'Length', Colors.blue, 'assets/icons/ruler.png', lengthDesignations, true));
  units.add(Unit(2, 'Weight', Colors.blue, 'assets/icons/libra.png', weightDesignations, true));
  units.add(Unit(3, 'Time', Colors.blue, 'assets/icons/stopwatch.png', timeDesignations, true));
  units.add(Unit(4, 'Volume', Colors.blue, 'assets/icons/water.png', volumeDesignations, true));
  units.add(Unit(5, 'Currency', Colors.blue, 'assets/icons/currency exchange.png', currencyDesignations, true));

  return units;
}