// To parse this JSON data, do
//
//     final catat = catatFromJson(jsonString);

import 'dart:convert';

Catat catatFromJson(String str) => Catat.fromJson(json.decode(str));

String catatToJson(Catat data) => json.encode(data.toJson());

class Catat {
    Catat({
        required this.user,
        required this.date,
        required this.weight,
        required this.height,
        required this.bmi,
    });

    int user;
    String date;
    double weight;
    double height;
    double bmi;

    factory Catat.fromJson(Map<String, dynamic> json) => Catat(
        user: json["user"],
        date: json["date"],
        weight: json["weight"].toDouble(),
        height: json["height"].toDouble(),
        bmi: json["bmi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date,
        "weight": weight,
        "height": height,
        "bmi": bmi,
    };
}
