import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:endterm_project/models/bacabund/artikel.dart';

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
