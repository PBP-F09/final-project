// part of '_catatbund.dart';

// Future<Catat> postCatat(Catat catat) async {
//   var url = Uri.parse(
//       'https://halowbund.up.railway.app/catatbund');
//   var response = await http.post(
//     url,
//     headers: {
//       'Access-Control-Allow-Origin': '*',
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode(catat.toJson()),
//   );
//   return jsonDecode(response.body)['success'];
// }

part of '_catatbund.dart';

Future<List<Catat>> postCatat(request, double weight, double height, BuildContext context, mounted, String username) async {
  
  final response = await http.post(Uri.parse('https://halowbund.up.railway.app/catatbund/add_request_flutter/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'username' : username,
        'weight': weight,
        'height': height,
      }));

      // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Catat> listCatat = [];
  for (var d in data) {
    if (d != null) {
      listCatat.add(Catat.fromJson(d));
    }
  }
  print(listCatat.toString()+"haha");
  return listCatat;

}