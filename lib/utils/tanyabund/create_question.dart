part of '_tanyabund.dart';

Future<void> createQuestion(text, role, id) async {
  // final url = Uri.parse('https://halowbund.up.railway.app/qna/add-flutter/$role/$id');
  final url = Uri.parse('http://10.0.2.2:8000/qna/add-flutter/$role/$id');
  final headers = {'Content-type': 'application/json'};
  await http.post(url, headers: headers, body: jsonEncode({'text': text}), encoding: Encoding.getByName('utf-8'));
}
