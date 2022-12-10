part of '_diarybund.dart';

Future<Diary> postDiary(Diary diary) async {
  var url = Uri.parse(
      'https://halowbund.up.railway.app/diarybund');
  var response = await http.post(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(diary.toJson()),
  );
  return jsonDecode(response.body)['success'];
}