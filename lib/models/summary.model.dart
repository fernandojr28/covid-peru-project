// To parse this JSON data, do
//
//     final summary = summaryFromJson(jsonString);

import 'dart:convert';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
    int confirmed;
    int recovered;
    int deaths;
    String dailySummary;
    String image;
    DateTime lastUpdate;

    Summary({
        this.confirmed,
        this.recovered,
        this.deaths,
        this.dailySummary,
        this.image,
        this.lastUpdate,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        confirmed: json["confirmed"]['value'],
        recovered: json["recovered"]['value'],
        deaths: json["deaths"]['value'],
        dailySummary: json["dailySummary"],
        image: json["image"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "dailySummary": dailySummary,
        "image": image,
        "lastUpdate": lastUpdate.toIso8601String(),
    };
}
