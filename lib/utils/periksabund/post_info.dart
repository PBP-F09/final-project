part of '_periksabund.dart';

void postNote(request, lokasi, tanggal, waktu, kapasitas_balita, username) async {
  final response = await request.post('https://halowbund.up.railway.app/periksa/postJsonNote/', {
    "username" : username,
    "lokasi" : lokasi,
    "tanggal" : tanggal,
    "waktu" : waktu,
    "kapasitas_balita": kapasitas_balita,
  });
}

void deleteInfo(int id) async {
  final response = await http.post(
    Uri.parse('https://halowbund.up.railway.app/periksa/deleteinfo/$id'),
  );
  print(response);
}
