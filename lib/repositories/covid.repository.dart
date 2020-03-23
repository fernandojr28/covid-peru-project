import 'dart:async';

import 'package:covid_peru_project/models/country.model.dart';
import 'package:covid_peru_project/models/summary.model.dart';
import 'package:covid_peru_project/repositories/covid_api_client.dart';

class CovidRepository {
  final CovidApiClient covidApiClient = CovidApiClient();

  CovidRepository();

  Future<Summary> summary() async {
    return await covidApiClient.summary();
  }

  Future<DeathsInWorld> deaths() async {
    return await covidApiClient.deaths();
  }

  Future<RecoveredInWorld> recovered() async {
    return await covidApiClient.recovered();
  }

  Future<ConfirmedInWorld> confirmed() async {
    return await covidApiClient.confirmed();
  }
}
