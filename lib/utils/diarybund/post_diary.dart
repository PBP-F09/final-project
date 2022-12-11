part of '_diarybund.dart';

// Future<Diary> postDiary(Diary diary) async {
//   var url = Uri.parse(
//       'https://halowbund.up.railway.app/diarybund');
//   var response = await http.post(
//     url,
//     headers: {
//       'Access-Control-Allow-Origin': '*',
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode(diary.toJson()),
//   );
//   return jsonDecode(response.body)['success'];
// }

void postDiary(request, String title, String abstract, String description, int emotion, BuildContext context, mounted) async {
  print("enggaaa");
  final response = await request.login('http://localhost:8000/diarybund/create-ajax-flutter/', {
      'title': title,
      'description': description,
      'abstract': abstract,
      'emotion': emotion.toString(),
  });
  print(response);
  print("iyaaaa");
}