// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  String provinceState;
  String countryRegion;
  int lastUpdate;
  double lat;
  double long;
  int confirmed;
  int recovered;
  int deaths;
  int active;
  dynamic admin2;
  dynamic fips;
  dynamic combinedKey;
  String iso2;
  String iso3;

  Country({
    this.provinceState,
    this.countryRegion,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.active,
    this.admin2,
    this.fips,
    this.combinedKey,
    this.iso2,
    this.iso3,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        provinceState: json["provinceState"],
        countryRegion: json["countryRegion"],
        lastUpdate: json["lastUpdate"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
        admin2: json["admin2"],
        fips: json["fips"],
        combinedKey: json["combinedKey"],
        iso2: json["iso2"],
        iso3: json["iso3"],
      );

  Map<String, dynamic> toJson() => {
        "provinceState": provinceState,
        "countryRegion": countryRegion,
        "lastUpdate": lastUpdate,
        "lat": lat,
        "long": long,
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
        "admin2": admin2,
        "fips": fips,
        "combinedKey": combinedKey,
        "iso2": iso2,
        "iso3": iso3,
      };
}
