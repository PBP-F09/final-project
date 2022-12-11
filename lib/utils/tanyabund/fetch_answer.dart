part of '_tanyabund.dart';

Future<List<AnswerModel>> fetchAnswerById(id) async {
  var url = Uri.parse('https://halowbund.up.railway.app/qna/json2filter/$id');
  var response = await http.get(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // melakukan konversi data json menjadi object ToDo
  List<AnswerModel> listAnswer = [];
  for (var d in data) {
    if (d != null) {
      listAnswer.add(AnswerModel.fromJson(d));
    }
  }

  return listAnswer;
}
