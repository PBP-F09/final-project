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
      ),
      // drawer: makeDrawer(context),
      body:
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
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ListDiary.list[reverseIndex].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          ListDiary.list[reverseIndex].date,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ListDiary.list[reverseIndex].shortdesc.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          ListDiary.list[reverseIndex].emotion,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: ListDiary.list.length,
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
              tooltip: 'Tambah Diary',
              child: const Icon(Icons.add_comment_rounded),
            ),
          ])),
    );
  }
}
