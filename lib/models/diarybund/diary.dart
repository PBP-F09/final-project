// To parse this JSON data, do
//
//     final diary = diaryFromJson(jsonString);

import 'dart:convert';

List<Diary> diaryFromJson(String str) => List<Diary>.from(json.decode(str).map((x) => Diary.fromJson(x)));

String diaryToJson(List<Diary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diary {
  Diary({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
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
    required this.title,
    required this.emotion,
    required this.fieldsAbstract,
    required this.description,
  });

  int user;
  DateTime date;
  String title;
  int emotion;
  String fieldsAbstract;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    date: DateTime.parse(json["date"]),
    title: json["title"],
    emotion: json["emotion"],
    fieldsAbstract: json["abstract"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "title": title,
    "emotion": emotion,
    "abstract": fieldsAbstract,
    "description": description,
  };
}
