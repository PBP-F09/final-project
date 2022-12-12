import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) =>
    List<QuestionModel>.from(
        json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
  QuestionModel({
    required this.model,
    required this.pk,
    required this.user,
    required this.text,
    required this.isAnswered,
    required this.date,
    required this.totalLike,
    required this.totalAnswer,
    required this.roleUser,
  });

  String model;
  int pk;
  String user;
  String text;
  bool isAnswered;
  DateTime date;
  int totalLike;
  int totalAnswer;
  String roleUser;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        model: json['model'],
        pk: json['pk'],
        user: List<String>.from(json['fields']['user'].map((x) => x)).first,
        text: json['fields']['text'],
        isAnswered: json['fields']['is_answered'],
        date: DateTime.parse(json['fields']['date']),
        totalLike: json['fields']['total_like'],
        totalAnswer: json['fields']['total_answer'],
        roleUser: json['fields']['role_user'],
      );

  Map<String, dynamic> toJson() => {
        'model': model,
        'pk': pk,
        'user': user,
        'text': text,
        'is_answered': isAnswered,
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'total_like': totalLike,
        'total_answer': totalAnswer,
        'role_user': roleUser,
      };
}
