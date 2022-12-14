part of '_tanyabund.dart';

Future<int> likeQuestion(id) async {
  final url = Uri.parse('https://halowbund.up.railway.app/qna/like-flutter/$id');
  final headers = {'Content-type': 'application/json'};
  final response = await http.patch(
    url,
    headers: headers,
  );

  int res = json.decode(response.body)['total_like'];
  return res;
}
