import 'dart:convert';

List<Note> informasiFromJson(String str) => List<Note>.from(
    json.decode(str).map((informasi) => Note.fromJson(informasi)));

String informasiToJson(List<Note> data) =>
    json.encode(List<dynamic>.from(data.map((informasi) => informasi.toJson())));

class Note {
  Note({
    required this.user,
    required this.lokasi,
    required this.tanggal,
    required this.waktu,
    required this.kapasitas_balita,
  });

  int user;
  String lokasi;
  String tanggal;
  String waktu;
  int kapasitas_balita;


  factory Note.fromJson(Map<String, dynamic> json) => Note(
        user: json['user_id'],
        lokasi: json['lokasi'],
        tanggal: json['tanggal'],
        waktu: json['waktu'],
        kapasitas_balita: json['kapasitas_balita'],
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'lokasi': lokasi,
        'tanggal': tanggal,
        'waktu': waktu,
        'kapasitas_balita': kapasitas_balita,
      };
}
