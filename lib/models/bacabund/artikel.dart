import 'dart:convert';

List<Artikel> artikelFromJson(String str) => List<Artikel>.from(
    json.decode(str).map((artikel) => Artikel.fromJson(artikel)));

String artikelToJson(List<Artikel> data) =>
    json.encode(List<dynamic>.from(data.map((artikel) => artikel.toJson())));

class Artikel {
  Artikel({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
    required this.date,
  });

  int id;
  String title;
  String body;
  int author;
  String date;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        id: json["pk"],
        title: json["fields"]["judul"],
        body: json["fields"]["isi"],
        author: json["fields"]["tanggal"],
        date: json["fields"]["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "author": author,
        "date": date,
      };
}
