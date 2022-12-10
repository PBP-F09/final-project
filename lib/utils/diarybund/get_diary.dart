part of '_diarybund.dart';

Future<List<Diary>> getDiary() async {
  var url = Uri.parse('https://halowbund.up.railway.app/diarybund/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Diary
  List<Diary> listDiary = [];
  for (var d in data) {
    if (d != null) {
      listDiary.add(Diary.fromJson(d));
    }
  }

  return listDiary;
}