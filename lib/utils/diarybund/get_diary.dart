part of '_diarybund.dart';

Future<List<Diary>> getDiary(String username) async {
  var url = Uri.parse('https://halowbund.up.railway.app/diarybund/json-flutter/$username');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  // print(utf8.decode(response.bodyBytes));
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Catat
  List<Diary> listCatat = [];
  for (var d in data) {
    // print("masuk");
    if (d != null) {
      // print("sini");
      // print(Diary.fromJson(d));
      listCatat.add(Diary.fromJson(d));
    }
  }
  return listCatat;
}