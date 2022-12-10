part of '_catatbund.dart';

class CatatBundPage extends StatefulWidget {
  const CatatBundPage({super.key});

  @override
  State<CatatBundPage> createState() => _CatatBundPageState();
}

class _CatatBundPageState extends State<CatatBundPage> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    String? username = request.jsonData['username'];
    String? role_user = request.jsonData['role_user'];
    print(role_user);
    return Scaffold(
      appBar: AppBar(
        title: Text('CatatBund'),
        backgroundColor: AppColors.merahMuda,
      ),
      // drawer: makeDrawer(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Halow, $username!",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(
                  "Bagaimana perkembangan Si Kecil hari ini? Yuk, dicatat sekarang juga~",
                  style:
                  TextStyle(fontSize: 16),
                ),)
              ],
            ),
          ),
          // Expanded(child:
              FutureBuilder(
              future: getCatat(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                    children: [
                      Text('Tidak ada catatan :(',
                      style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20),
                      ),
                    ],
                    );
                  } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                        int reverseIndex = ListCatat.list.length - 1 - index;
                        return Card (
                          child: ListTile(
                            subtitle: Text(snapshot.data![index].weight),
                            title: Text(snapshot.data![index].height),
                          ),
                        );
                      }
                      );
                  }
              }
          },
        )
        ],),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => CatatForm()),
                );
              },
              tooltip: 'Tulis Catatan',
              child: const Icon(Icons.add_comment_rounded),
            ),
          ])),
    );
  }
}