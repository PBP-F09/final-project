part of '_tanyabund.dart';

Future<dynamic> deleteQuestion(uid, role, id) async {
  final url =
      Uri.parse('https://halowbund.up.railway.app/qna/delete-flutter/$uid/$role/$id');
  final headers = {'Content-type': 'application/json'};
  final response = await http.delete(url, headers: headers);

  final decodedResponse = jsonDecode(jsonEncode(response.body));
  return decodedResponse;
}
