import 'dart:convert';

List<Catat> catatFromJson(String str) => List<Catat>.from(json.decode(str).map((x) => Catat.fromJson(x)));

String catatToJson(List<Catat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catat {
  Catat({
    // required this.model,
    required this.pk,
    // required this.fields,
    required this.user,
    required this.date,
    required this.weight,
    required this.height,
  });

  int pk;
  int user;
  DateTime date;
  String weight;
  String height;

  factory Catat.fromJson(Map<String, dynamic> json) => Catat(
    // model: modelValues.map[json["model"]],
    pk: json['pk'],
    user: json['fields']['user'],
    date: DateTime.parse(json['fields']["date"]),
    weight: json['fields']['weight'],
    height: json['fields']['height'],
  );

  Map<String, dynamic> toJson() => {
    'pk': pk,
    'user': user,
    'date': "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'weight': weight,
    'height': height,
  };
}