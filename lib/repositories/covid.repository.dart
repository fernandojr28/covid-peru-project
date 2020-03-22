import 'dart:async';

import 'package:covid_peru_project/models/country.model.dart';
import 'package:covid_peru_project/models/summary.model.dart';
import 'package:covid_peru_project/repositories/covid_api_client.dart';

class CovidRepository {
  final CovidApiClient covidApiClient;

  CovidRepository(this.covidApiClient);

  Future<Summary> summary() async {
    return await covidApiClient.summary();
  }

  Future<List<Country>> deaths() async {
    return await covidApiClient.deaths();
  }
}
