// To parse this JSON data, do
//
//     final diary = diaryFromJson(jsonString);

import 'dart:convert';

List<Catat> catatFromJson(String str) => List<Catat>.from(json.decode(str).map((x) => Catat.fromJson(x)));

String catatToJson(List<Catat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catat {
  Catat({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Catat.fromJson(Map<String, dynamic> json) => Catat(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.date,
    required this.weight,
    required this.height,
  });

  int user;
  DateTime date;
  String weight;
  String height;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    date: DateTime.parse(json["date"]),
    weight: json["weight"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "weight": weight,
    "height": height,
  };
}
