part of '_diarybund.dart';

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