part of '_bacabund.dart';

Future<Artikel> postArtikel(Artikel artikel) async {
  var url = Uri.parse(
      'https://halowbund.up.railway.app/artikel-kesehatan/tambah-artikel/');
  var response = await http.post(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(artikel.toJson()),
  );
  print(response.body);
  return Artikel.fromJson(jsonDecode(response.body));
}

void postArtikel2(request, String judul, String isi, BuildContext context, mounted) async {
  print("masuk ke post artikel 2");
  final response = await request.post('https://halowbund.up.railway.app/artikel-kesehatan/tambah-artikel/', {
    'judul': judul,
    'isi': isi,
  });
  print(response);
}
