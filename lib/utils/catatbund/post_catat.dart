part of '_catatbund.dart';

Future<Catat> postCatat(Catat catat) async {
  var url = Uri.parse(
      'https://halowbund.up.railway.app/catatbund');
  var response = await http.post(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(catat.toJson()),
  );
  return jsonDecode(response.body)['success'];
}