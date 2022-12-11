part of '_diarybund.dart';

Future<List<Diary>> getDiary() async {
  var url = Uri.parse('http://localhost:8000/diarybund/json-flutter/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  // final response = await request.get(Uri.parse('https://halowbund.up.railway.app/diarybund/json/'));

  // melakukan decode response menjadi bentuk json
  print(utf8.decode(response.bodyBytes));
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // print(data);

  print('sesuatu apa aja');
  // melakukan konversi data json menjadi object Diary
  List<Diary> listDiary = [];
  for (var d in data) {
    print("masuk sini");
    print(Diary.fromJson(d).fields.title);
    if (d != null) {
      print("masuk sokin");
      listDiary.add(Diary.fromJson(d));
    }
  }

  return listDiary;
}