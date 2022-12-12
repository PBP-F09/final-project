part of '_periksabund.dart';

class Informasi extends StatefulWidget {
  const Informasi({super.key});

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final request = context.watch<CookieRequest>();
    String? username = request.jsonData['username'];
    String? role_user = request.jsonData['role_user'];
    print(role_user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BacaBund'),
      ),
      body: FutureBuilder(
        // future: getArtikel(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('artikel kosong'),
            );
          } 
          return const Center(
              child: Text('artikel kosong'),
            );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FormTambahInformasi()));
        },
        icon: const Icon(Icons.add),
        label: const Text('Tambah Artikel'),
      ),
    );
  }
}