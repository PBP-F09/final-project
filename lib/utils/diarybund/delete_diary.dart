part of '_diarybund.dart';

// Delete JSON data from the specified URL
Future<dynamic> deleteDiary(int pk) async {
  final url = Uri.parse('https://halowbund.up.railway.app/diarybund/delete-flutter/$pk');
  final headers = {'Content-type': 'application/json'};
  final response = await http.delete(url, headers: headers);

  return jsonDecode(response.body);
}