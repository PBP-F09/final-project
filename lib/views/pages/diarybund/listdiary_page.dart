part of '_diarybund.dart';

class DiaryBundPage extends StatefulWidget {
  const DiaryBundPage({super.key});

  @override
  State<DiaryBundPage> createState() => _DiaryBundPageState();
}

class _DiaryBundPageState extends State<DiaryBundPage> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    String? username = request.jsonData['username'];
    String? role_user = request.jsonData['role_user'];
    print(role_user);
    return Scaffold(
      appBar: AppBar(
        title: Text('DiaryBund'),
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
                  "Bagaimana rutinitas Bunda dan Si Kecil hari ini? Yuk, ceritakan sekarang juga~",
                  style:
                  TextStyle(fontSize: 16),
                ),)
              ],
            ),
          ),
          // Expanded(child:
              FutureBuilder(
              future: getDiary(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                    children: [
                      Text('Tidak ada diary :(',
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
                        int reverseIndex = ListDiary.list.length - 1 - index;
                        return MaterialButton(
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => DiaryDetails(
                              diary:
                                snapshot.data![reverseIndex],
                              )),
                            );
                          },
                          child: Card(
                            color: AppColors.creamMuda,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${snapshot.data![reverseIndex].date}',
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '${snapshot.data![reverseIndex].title}',
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '${snapshot.data![reverseIndex].abstract}',
                                        style: const TextStyle(fontSize: 16, color: AppColors.merahMuda),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Chip(
                                          label: Text('${snapshot.data![reverseIndex].emotion}',),
                                          labelStyle: TextStyle(color: AppColors.merahTua),
                                          backgroundColor: AppColors.creamTua,
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      );
                  }
              }
          },
        )
      // )
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
                builder: (context) => DiaryForm()),
                );
              },
              tooltip: 'Tulis Diary',
              child: const Icon(Icons.add_comment_rounded),
            ),
          ])),
    );
  }
}
