part of '_diarybund.dart';

class DiaryBundPage extends StatefulWidget {
  const DiaryBundPage({super.key});

  @override
  State<DiaryBundPage> createState() => _DiaryBundPageState();
}

class _DiaryBundPageState extends State<DiaryBundPage> {
  @override
  Widget build(BuildContext context) {
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
                  "Halow, mayfa!",
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
          Expanded(child:
          ListView.builder(
            itemBuilder: (context, index) {
              int reverseIndex = ListDiary.list.length - 1 - index;
              return MaterialButton(
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiaryDetails(
                          // diary:
                          // Diary.data![index],
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
                              ListDiary.list[reverseIndex].date,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              ListDiary.list[reverseIndex].title,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              ListDiary.list[reverseIndex].shortdesc.toString(),
                              style: const TextStyle(fontSize: 16, color: AppColors.merahMuda),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              label: Text(ListDiary.list[reverseIndex].emotion),
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
            },
            itemCount: ListDiary.list.length,
          ),)
        ],
      ),
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
