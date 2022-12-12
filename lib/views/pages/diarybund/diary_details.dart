part of '_diarybund.dart';

class DiaryDetails extends StatelessWidget {
  final Diary diary;
  const DiaryDetails({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('DiaryBund'),
          backgroundColor: AppColors.merahMuda,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      deleteDiary(diary.pk);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(child: const Text('Informasi DiaryBund')),
                                  Center(child: Text(diary.fields.title)),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                      child:
                                      Text('Diary berhasil dihapus!')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: TextButton(
                                      child: const Text('Kembali', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DiaryBundPage()),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(AppColors.merahTua),
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      size: 26.0,
                    ),
                  )
              ),
            ],
        ),
        // drawer: makeDrawer(context),
        body: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Padding (
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // diary.fields.date.toString(),
                        '${diary.fields.date.year.toString().padLeft(4, '0')}-${diary.fields.date.month.toString().padLeft(2, '0')}-${diary.fields.date.day.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        diary.fields.title,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Chip(
                        label: Text(diary.fields.emotion == 1? "Senang" :
                        diary.fields.emotion == 2? "Biasa" :
                        diary.fields.emotion == 3? "Sedih" :
                        "Marah"),
                        labelStyle: TextStyle(color: AppColors.merahTua),
                        backgroundColor: AppColors.creamTua,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      diary.fields.fieldsAbstract,
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic, color: AppColors.merahMuda),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                        diary.fields.description,
                        style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.merahTua,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),),
        ));
  }
}