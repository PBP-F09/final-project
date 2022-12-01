import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:endterm_project/models/bacabund/artikel.dart';

Future<List<Artikel>> getArtikel() async {
  var url = Uri.parse("");
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Artikel> artikel = [];
  for (var d in data) {
    if (d != null) {
      artikel.add(Artikel.fromJson(d));
    }
  }
  return artikel;
}

// dari github copilot
Future<Artikel> postArtikel(Artikel artikel) async {
  var url = Uri.parse("");
  var response = await http.post(url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      body: jsonEncode(artikel.toJson()));
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  return Artikel.fromJson(data);
}
