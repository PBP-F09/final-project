import 'dart:convert';

List<Artikel> artikelFromJson(String str) => List<Artikel>.from(
    json.decode(str).map((artikel) => Artikel.fromJson(artikel)));

String artikelToJson(List<Artikel> data) =>
    json.encode(List<dynamic>.from(data.map((artikel) => artikel.toJson())));

class Artikel {
  Artikel({
    required this.id,
    required this.judul,
    required this.isi,
    required this.author,
    required this.tanggal,
  });

  int id;
  String judul;
  String isi;
  String author;
  String tanggal;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        id: json['pk'],
        judul: json['fields']['judul'],
        isi: json['fields']['isi'],
        tanggal: json['fields']['tanggal'],
        author: json['fields']['author'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'isi': isi,
        'author': author,
        'tanggal': tanggal,
      };
}
