// To parse this JSON data, do
//
//     final dailyGlobal = dailyGlobalFromJson(jsonString);

import 'dart:convert';

DailyGlobal dailyGlobalFromJson(String str) => DailyGlobal.fromJson(json.decode(str));

String dailyGlobalToJson(DailyGlobal data) => json.encode(data.toJson());

class DailyGlobal {
    int reportDate;
    int mainlandChina;
    int otherLocations;
    int totalConfirmed;
    dynamic totalRecovered;
    String reportDateString;
    int deltaConfirmed;
    dynamic deltaRecovered;
    int objectid;

    DailyGlobal({
        this.reportDate,
        this.mainlandChina,
        this.otherLocations,
        this.totalConfirmed,
        this.totalRecovered,
        this.reportDateString,
        this.deltaConfirmed,
        this.deltaRecovered,
        this.objectid,
    });

    factory DailyGlobal.fromJson(Map<String, dynamic> json) => DailyGlobal(
        reportDate: json["reportDate"],
        mainlandChina: json["mainlandChina"],
        otherLocations: json["otherLocations"],
        totalConfirmed: json["totalConfirmed"],
        totalRecovered: json["totalRecovered"],
        reportDateString: json["reportDateString"],
        deltaConfirmed: json["deltaConfirmed"],
        deltaRecovered: json["deltaRecovered"],
        objectid: json["objectid"],
    );

    Map<String, dynamic> toJson() => {
        "reportDate": reportDate,
        "mainlandChina": mainlandChina,
        "otherLocations": otherLocations,
        "totalConfirmed": totalConfirmed,
        "totalRecovered": totalRecovered,
        "reportDateString": reportDateString,
        "deltaConfirmed": deltaConfirmed,
        "deltaRecovered": deltaRecovered,
        "objectid": objectid,
    };
}
