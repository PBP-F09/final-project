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
    return Scaffold(
      appBar: AppBar(
        title: const Text('BacaBund'),
      ),
      body: FutureBuilder(
        future: getArtikel(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('artikel kosong'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                String title = snapshot.data[index].title;
                String body = snapshot.data[index].body;
                String tanggal = snapshot.data[index].date.substring(0, 10);
                int author = snapshot.data[index].author;
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
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
      floatingActionButton: (role_user == "admin")
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormTambahArtikel()));
              },
              icon: const Icon(Icons.add),
              label: const Text("Tambah Artikel"),
            )
          : Container(),
    );
  }
}
