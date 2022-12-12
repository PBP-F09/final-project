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
    if (role_user == "bumil" || role_user == "Bunda") {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage()),
                );
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('DiaryBund'),
          backgroundColor: AppColors.merahMuda,
        ),
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
              future: getDiary(request.jsonData['username']),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: const SpinKitProgressIndicator());
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
                    return Expanded(child:
                    ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          int reverseIndex = snapshot.data!.length - 1 - index;
                          String emotionString = "";
                          if (snapshot.data![reverseIndex].fields.emotion == 1) {
                            emotionString = 'Senang';
                          } else if (snapshot.data![reverseIndex].fields.emotion == 2) {
                            emotionString = 'Biasa';
                          } else if (snapshot.data![reverseIndex].fields.emotion == 3) {
                            emotionString = 'Sedih';
                          } else {
                            emotionString = 'Marah';
                          }
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
                                          // '${snapshot.data![index].fields.date}',
                                          '${snapshot.data![reverseIndex].fields.date.year.toString().padLeft(4, '0')}-${snapshot.data![reverseIndex].fields.date.month.toString().padLeft(2, '0')}-${snapshot.data![reverseIndex].fields.date.day.toString().padLeft(2, '0')}',
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '${snapshot.data![reverseIndex].fields.title}',
                                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '${snapshot.data![reverseIndex].fields.fieldsAbstract}',
                                          style: const TextStyle(fontSize: 16, color: AppColors.merahMuda),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Chip(
                                          label: Text(emotionString,),
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
                        })
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
                backgroundColor: AppColors.merahMuda,
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
    } else {
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
                    "Maaf, fitur DiaryBund hanya dapat diakses oleh Bunda!",
                    style:
                    TextStyle(fontSize: 16),
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child:
              ElevatedButton(
                child: const Text(
                  "Log In sebagai Bunda",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.merahTua,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()),
                  );
                },
              ),),
          ],),
      );
    }
  }
}
