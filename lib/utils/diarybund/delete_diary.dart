part of '_diarybund.dart';

// Delete JSON data from the specified URL
void deleteDiary(request, int pk) async {
  final response = await request.delete('http://localhost:8000/diarybund/delete-flutter/$pk', {
    'pk': pk
  });
}