part of '_diarybund.dart';

Future<List<Diary>> getDiary(request, username) async {
  final response =
  await request.login('http://localhost:8000/diarybund/json-flutter/', {
    'username': username
  });
  // final response = await request.get(Uri.parse('https://halowbund.up.railway.app/diarybund/json/'));

  print(response);

  List<Diary> listDiary = [];
  for (var i = 0; i < response['data'].length; i++){
    print(response['data'][i]['user_id']);
    print(response['data'][i]);
    Fields newField = new Fields(
        user: response['data'][i]['user_id'],
        date: DateTime.parse(response['data'][i]['date']),
        title: response['data'][i]['title'],
        emotion: response['data'][i]['emotion'],
        fieldsAbstract: response['data'][i]['abstract'],
        description: response['data'][i]['description']);
    Diary newDiary = new Diary(pk: response['data'][i]['id'], fields: newField);
    listDiary.add(newDiary);
  }

  return listDiary;
}