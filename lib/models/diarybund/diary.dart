// To parse this JSON data, do
//
//     final diary = diaryFromJson(jsonString);

import 'dart:convert';

List<Diary> diaryFromJson(String str) => List<Diary>.from(json.decode(str).map((x) => Diary.fromJson(x)));

String diaryToJson(List<Diary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diary {
  Diary({
    // required this.model,
    required this.pk,
    // required this.fields,
    required this.user,
    required this.date,
    required this.title,
    required this.emotion,
    required this.abstract,
    required this.description,
  });

  int pk;
  int user;
  DateTime date;
  String title;
  int emotion;
  String abstract;
  String description;
  // Model? model;
  // int pk;
  // Fields fields;

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
    // model: modelValues.map[json["model"]],
    pk: json['pk'],
    user: json['fields']['user'],
    date: DateTime.parse(json['fields']["date"]),
    title: json['fields']['title'],
    emotion: json['fields']['emotion'],
    abstract: json['fields']['abstract'],
    description: json['fields']['description'],
    // fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    'pk': pk,
    'user': user,
    'date': "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'title': title,
    'emotion': emotion,
    'abstract': abstract,
    'description': description,
  };
}
//
// class Fields {
//   Fields({
//     required this.user,
//     required this.date,
//     required this.title,
//     required this.emotion,
//     required this.fieldsAbstract,
//     required this.description,
//   });
//
//   int user;
//   DateTime date;
//   String title;
//   int emotion;
//   String fieldsAbstract;
//   String description;
//
//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//     user: json["user"],
//     date: DateTime.parse(json["date"]),
//     title: json["title"],
//     emotion: json["emotion"],
//     fieldsAbstract: json["abstract"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user,
//     "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//     "title": title,
//     "emotion": emotion,
//     "abstract": fieldsAbstract,
//     "description": description,
//   };
// }
//
// enum Model { DIARYBUND_DIARYBUND }
//
// final modelValues = EnumValues({
//   "diarybund.diarybund": Model.DIARYBUND_DIARYBUND
// });
//
// class EnumValues<T> {
//   late Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
<<<<<<< HEAD
// }
=======
// }
>>>>>>> 28f9880f03c471f749fd377b185c0159a98571c1
