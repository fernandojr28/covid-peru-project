import 'dart:convert';

import 'package:covid_peru_project/models/country.model.dart';
import 'package:covid_peru_project/models/summary.model.dart';
import 'package:http/http.dart' as http;

class CovidApiClient {
  final _baseUrl = 'https://covid19.mathdro.id/api/';

  Future<Summary> summary() async {
    String url = "$_baseUrl";
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    return Summary.fromJson(json);
  }

  Future<List<Country>> deaths() async {
    String url = "${_baseUrl}deaths";
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);

    List<Country> list = [];

    for (var item in json) {
      list.add(Country.fromJson(item));
    }

    return list;
  }
}
