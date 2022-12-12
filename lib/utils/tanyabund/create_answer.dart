part of '_tanyabund.dart';

Future<int> createAnswer(text, uid, role, qid) async {
  final url = Uri.parse('https://halowbund.up.railway.app/qna/answer-flutter/$uid/$role/$qid');
  final headers = {'Content-type': 'application/json'};
  final response = await http.post(url,
      headers: headers,
      body: jsonEncode({'text': text}),
      );

  int totalAnswer = json.decode(response.body)['fields']['total_answer'];
  return totalAnswer;
}
