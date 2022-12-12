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
              future: getCatat(request.jsonData['username']),
              builder: (context, AsyncSnapshot snapshot) {
                
                if (snapshot.data == null) {
                  return const Center(child: SpinKitProgressIndicator());
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
                    return Expanded(child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
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
                                          "${snapshot.data![index].date}",
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Berat badan(kg): ${snapshot.data![index].weight.toString()}",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Tinggi badan(m): ${snapshot.data![index].height.toString()}",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "BMI: ${snapshot.data![index].bmi.toString()}",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.merahMuda),
                                        ),
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ),
                            )
                          
                        ),);
                    
                    
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
              backgroundColor: AppColors.merahMuda,
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

    } else {
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
                    "Maaf, fitur CatatBund hanya dapat diakses oleh Bunda!",
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