part of '_periksabund.dart';

void postNote(request, lokasi, tanggal, waktu, kapasitas_balita, username) async {
  final response = await request.post('http://10.0.2.2:8000/periksa/postJsonNote/', {
    "username" : username,
    "lokasi" : lokasi,
    "tanggal" : tanggal,
    "waktu" : waktu,
    "kapasitas_balita": kapasitas_balita,
  });
}

void deleteInfo(int id) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/periksa/deleteinfo/$id'),
  );
  print(response);
}
