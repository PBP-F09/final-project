part of '_periksabund.dart';

class DetailInfo extends StatelessWidget {
  final Note note;
  const DetailInfo({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    if (request.jsonData['role_user'] == 'Admin' ||
        request.jsonData['role_user'] == 'Bunda') {
            return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kegiatan Vaksin'),
        backgroundColor: AppColors.merahMuda,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                note.lokasi,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Waktu: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.waktu, style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Tanggal Tersedia: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.tanggal, style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Kapasitas Balita: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.kapasitas_balita.toString(), style: TextStyle(fontSize: 20),),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          child: Text('Kembali'),
          style: ElevatedButton.styleFrom(
            primary: AppColors.merahMuda,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const PeriksaBundPage(),
              ));
          },))
          );
        } else {
          return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kegiatan Vaksin'),
        backgroundColor: AppColors.merahMuda,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                note.lokasi,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Waktu: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.waktu, style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Tanggal Tersedia: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.tanggal, style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Kapasitas Balita: ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(note.kapasitas_balita.toString(), style: TextStyle(fontSize: 20),),
              ],
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                deleteInfo(note.id);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PeriksaBundPage(),)
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.merahMuda),
              )
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          child: Text('Kembali'),
          style: ElevatedButton.styleFrom(
            primary: AppColors.merahMuda,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const PeriksaBundPage(),
              ));
          },))
          );
        }         
  }
}