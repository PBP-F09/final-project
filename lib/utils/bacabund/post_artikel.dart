part of '_bacabund.dart';

Future<Artikel> postArtikel(Artikel artikel) async {
  print(">>> masuk fungsi postArtikel");
  var url = Uri.parse(
      'https://halowbund.up.railway.app/artikel-kesehatan/tambah-artikel');
  var response = await http.post(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(artikel.toJson()),
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  return Artikel.fromJson(data);
}
