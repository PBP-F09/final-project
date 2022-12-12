part of '_diarybund.dart';

Future<List<Diary>> postDiary(request, String title, String abstract, String description, int emotion, String username, BuildContext context, mounted) async {

  final response = await http.post(Uri.parse('https://halowbund.up.railway.app/diarybund/create-ajax-flutter/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'username' : username,
        'title': title,
        'description': description,
        'abstract': abstract,
        'emotion': emotion,
      }));

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Diary> listCatat = [];
  for (var d in data) {
    if (d != null) {
      listCatat.add(Diary.fromJson(d));
    }
  }
  return listCatat;

}