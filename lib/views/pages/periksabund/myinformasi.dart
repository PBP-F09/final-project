part of '_periksabund.dart';

class MyInformasi extends StatefulWidget {
  const MyInformasi({super.key});

  @override
  State<MyInformasi> createState() => _MyInformasiState();
}

class _MyInformasiState extends State<MyInformasi> {
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
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                    children: [
                      Text('Berikut informasi kegiatan posyandu & vaksin yang tersedia:',
                      style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20),
                      ),
                    ],
                    );
                  }
                }
            return const Center(
                child: Text('artikel kosong'),
              );
              }
          
        )
      // )
        ],),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [

          ])),
    );
  }
}