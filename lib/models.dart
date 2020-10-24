import 'dart:developer';
import 'dart:ui';

class Region {

  String _name;
  Clr _colorMode;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Clr get colorMode => _colorMode;

  set colorMode(Clr value) {
    _colorMode = value;
  }

  Region({String rName, Clr rColor}) {
    this.name = rName;
    this.colorMode = rColor;
  }

  Region.name(this._name, this._colorMode);
}

class Clr {
  int _r;
  int _g;
  int _b;
  int _a;

  Clr({int r, int g, int b, int a}) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }

  Clr.name(this._r, this._g, this._b, this._a);

  int get a => _a;

  set a(int value) {
    _a = value;
  }

  int get b => _b;

  set b(int value) {
    _b = value;
  }

  int get g => _g;

  set g(int value) {
    _g = value;
  }

  int get r => _r;

  set r(int value) {
    _r = value;
  }
}

class Currency{
  String _symbol;
  String _name;
  String _currencyCode;
  Currency(this._symbol,this._name,this._currencyCode);
  get cName => _name;
  get cSymbol => _symbol;
  get cCurrencyCode => _currencyCode;
}

class Country {

  Region _region;
  String _name;
  String _demonym;
  String _flagUrl;
  String _alpha3Code;
  String _capital;
  String _callingCodes;
  String _currencyName;
  String _population;
  Currency _currency;

  String get population => _population;

  set population(String value) {
    _population = value;
  }

  @Deprecated('Use Model Class')
  String get currencyName => _currencyName;

  set currencyName(String value) {
    _currencyName = value;
  }

  String get callingCodes => _callingCodes;

  set callingCodes(String value) {
    _callingCodes = value;
  }

  String get capital => _capital;

  set capital(String value) {
    _capital = value;
  }

  String get alpha3Code => _alpha3Code;

  set alpha3Code(String value) {
    _alpha3Code = value;
  }

  String get flagUrl => _flagUrl;

  set flagUrl(String value) {
    _flagUrl = value;
  }

  String get demonym => _demonym;

  set demonym(String value) {
    _demonym = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Region get region => _region;

  set region(Region value) {
    _region = value;
  }


  Country(this._region,
      this._name,
      this._demonym,
      this._flagUrl,
      this._alpha3Code,
      this._capital,
      this._callingCodes,
      this._currencyName,
      this._population,{
    Currency currency
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    log("callingCodes -> ${json['callingCodes']}");
    return null;
    //return Country( json['region'],json['name'],json['demonym'],json['flag'],json['alpha3Code'],json['capital'],json['callingCodes']);
  }

  static List<Country> listFromJson(List<dynamic> records,{Region region}) {
    List<Country> countries = List<Country>();
    records.forEach((json) {
      //log("callingCodes -> ${json['callingCodes'][0]}");
      Currency cur = Currency(json['currencies'][0]['symbol'], json['currencies'][0]['name'], json['currencies'][0]['currencyCode']);
      //Country cntry = Country(json['region'], json['name'], json['demonym'], json['flag'], json['alpha3Code'], json['capital'], json['callingCodes'][0], cur.cName , json['population'],currency: cur);
      int popu = json['population'];
      log("Region Details -> ${region}");
      Country cntry = Country(region, json['name'], json['demonym'], json['flag'], json['alpha3Code'], json['capital'], json['callingCodes'][0], cur.cName , popu.toString(),currency: cur);
      countries.add(cntry);
    });
    return countries;
  }
/*
        "population": 27657145,
        "name": "Afghanistan",
        "region": "Asia",
        "demonym": "Afghan",
	      "flag": "https://restcountries.eu/data/afg.svg",
        "alpha3Code": "AFG",
        "capital": "Kabul",
        "callingCodes": ["93"],
	      "currencies": [
            {
                "code": "AFN",
                "name": "Afghan afghani",
                "symbol": "؋"
            }
        ]
* */


}