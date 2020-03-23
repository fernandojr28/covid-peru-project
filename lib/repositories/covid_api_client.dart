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

  Future<DeathsInWorld> deaths() async {
    String url = "${_baseUrl}deaths";
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return DeathsInWorld.fromJson(json);
  }

  Future<ConfirmedInWorld> confirmed() async {
    String url = "${_baseUrl}confirmed";
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return ConfirmedInWorld.fromJson(json);
  }

  Future<RecoveredInWorld> recovered() async {
    String url = "${_baseUrl}recovered";
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return RecoveredInWorld.fromJson(json);
  }
}
