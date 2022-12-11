part of '_catatbund.dart';

Future<List<Catat>> getCatat() async {
  var url = Uri.parse('https://halowbund.up.railway.app/catatbund/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  print(utf8.decode(response.bodyBytes));
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Catat
  List<Catat> listCatat = [];
  for (var d in data) {
    if (d != null) {
      listCatat.add(Catat.fromJson(d));
    }
  }

  return listCatat;
}