part of '_periksabund.dart';

Future<List<Note>> getNote(request) async {
  final response = await request.get('https://halowbund.up.railway.app/periksa/getJsonNote/');
  List<Note> informasi = [];
  for (var d in response['data']) {
    if (d != null) {
      informasi.add(Note.fromJson(d));
    }
  }
  return informasi;
}
