import 'dart:convert';

List<AnswerModel> answerModelFromJson(String str) => List<AnswerModel>.from(json.decode(str).map((x) => AnswerModel.fromJson(x)));

String answerModelToJson(List<AnswerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnswerModel {
    AnswerModel({
        required this.model,
        required this.pk,
        required this.user,
        required this.text,
        required this.date,
        required this.questionPk,
        required this.roleUser,
    });

    String model;
    int pk;
    String user;
    String text;
    DateTime date;
    int questionPk;
    String roleUser;

    factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        model: json['model'],
        pk: json['pk'],
        user: List<String>.from(json['fields']['user'].map((x) => x)).first,
        text: json['fields']['text'],
        date: DateTime.parse(json['fields']['date']),
        questionPk: json['fields']['question'],
        roleUser: json['fields']['role_user'],
    );

    Map<String, dynamic> toJson() => {
        'model': model,
        'pk': pk,
        'user': user,
        'text': text,
        'date': "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'question': questionPk,
        'role_user': roleUser,
    };
}

// class Fields {
//     Fields({
//         this.user,
//         this.text,
//         this.date,
//         this.question,
//         this.roleUser,
//     });

//     List<String> user;
//     String text;
//     DateTime date;
//     int question;
//     String roleUser;

//     factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         user: List<String>.from(json['user'].map((x) => x)),
//         text: json['text'],
//         date: DateTime.parse(json['date']),
//         question: json['question'],
//         roleUser: json['role_user'],
//     );

//     Map<String, dynamic> toJson() => {
//         'user': List<dynamic>.from(user.map((x) => x)),
//         'text': text,
//         'date': "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         'question': question,
//         'role_user': roleUser,
//     };
// }
