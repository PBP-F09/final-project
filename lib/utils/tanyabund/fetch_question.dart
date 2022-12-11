part of '_tanyabund.dart';

Future<List<QuestionModel>> fetchQuestion() async {
  var url = Uri.parse('http://10.0.2.2:8000/qna/json/');
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
  List<QuestionModel> listToDo = [];
  for (var d in data) {
    if (d != null) {
      listToDo.add(QuestionModel.fromJson(d));
    }
  }

  return listToDo;
}