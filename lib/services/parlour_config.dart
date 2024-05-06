import 'dart:convert';

import 'package:http/http.dart' as http;

class ParlourConfigService {
  final String primaryVariable = 'https://qa.miinsightsapps.net/strawberry/';
  final String environmentUrl =
      'https://qa.miinsightsapps.net/strawberry/cclapi/';
  final String prodEnvironmentUrl =
      'https://insightsqa.dedicated.co.za:91/parlour-config';

  // URLs
  String get getProdCat => environmentUrl + 'get-product-categories/';
  String get parlourList => prodEnvironmentUrl + '/basic-fetch/?what=insurers';
  String getAggregateQuoteUrl(String dob) =>
      prodEnvironmentUrl + '/basic-fetch/?what=parlour_qoutes&dob=$dob';
  String getParlourProductsUrl(String parlour) =>
      prodEnvironmentUrl + '/rates-obj/?parlour=$parlour';
  String getMainRatesUrl(String clientId) =>
      prodEnvironmentUrl + '/get-parlour-rates-extras/?client_id=$clientId';

  final http.Client httpClient;

  ParlourConfigService({required this.httpClient});

  Future<dynamic> getProductCategory() async {
    var response = await httpClient.get(Uri.parse(getProdCat));
    return json.decode(response.body);
  }

  Future<dynamic> getProducts() async {
    var response = await httpClient.get(Uri.parse(parlourList));
    return json.decode(response.body);
  }

  Future<dynamic> getParlourProduct(String parlour) async {
    String url =
        getParlourProductsUrl(parlour) + '&username=test&password=12345';
    var response = await httpClient.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<dynamic> getAggregateQuote(String dob) async {
    var response = await httpClient.get(Uri.parse(getAggregateQuoteUrl(dob)));
    return json.decode(response.body);
  }

  Future<dynamic> getMainRates(String clientId) async {
    var response = await httpClient.get(Uri.parse(getMainRatesUrl(clientId)));
    return json.decode(response.body);
  }
}
