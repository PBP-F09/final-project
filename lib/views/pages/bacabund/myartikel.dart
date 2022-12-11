part of '_bacabund.dart';

class BacaBundPage extends StatefulWidget {
  const BacaBundPage({super.key});

  @override
  State<BacaBundPage> createState() => _BacaBundPageState();
}

class _BacaBundPageState extends State<BacaBundPage> {
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
        future: getArtikel(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.length == 0) {
            return const Center(
              child: Text('Tidak ada artikel'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String title = snapshot.data![index].judul;
                String body = snapshot.data![index].isi;
                String tanggal = snapshot.data![index].tanggal.substring(0, 10);
                String author = snapshot.data![index].author;
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].judul),
                    subtitle: Text(tanggal),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailArtikel(
                          title: title,
                          body: body,
                          author: author,
                          date: tanggal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: (role_user == 'admin' || role_user == 'Admin')
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormTambahArtikel(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah Artikel'),
            )
          : Container(),
    );
  }
}
