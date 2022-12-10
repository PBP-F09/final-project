part of '_diarybund.dart';

class DiaryForm extends StatefulWidget {
  const DiaryForm({super.key});

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

// class Diary {
//   String title = "";
//   String shortdesc = "";
//   String longdesc = "";
//   String emotion = "";
//   String date = "";
//
//   Diary(String _title, String _short_desc, String _long_desc, String _emotion,
//       String _date) {
//     title = _title;
//     shortdesc = _short_desc;
//     longdesc = _long_desc;
//     emotion = _emotion;
//     date = _date;
//   }
// }

class ListDiary {
  static List<Diary> list = [];
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  String _title = "";
  String _shortdesc = "";
  String _longdesc = "";
  String _emotion = 'Senang';
  String _date = "2022-12-08";
  List<String> listEmotion = ['Senang', 'Sedih', 'Marah', 'Biasa'];
  ListDiary listDiary = new ListDiary();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Diary'),
        backgroundColor: AppColors.merahMuda,
      ),
      // drawer: makeDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${date.day}/${date.month}/${date.year}'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.merahMuda,),
                        child: Text('Pilih Tanggal'),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (newDate == null) return;
                          setState(() {
                            date = newDate;
                            _date = newDate.toString();
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Si Kecil sedang sedih",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Adik menangis karena temannya pergi",
                      labelText: "Deskripsi Singkat",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _shortdesc = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _shortdesc = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi Singkat tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Adik menangis karena temannya pergi",
                      labelText: "Deskripsi Lengkap",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _longdesc = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _longdesc = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi Lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.all(8.0),
                  child:
                  ListTile(
                    leading: const Icon(Icons.emoji_emotions),
                    title: const Text(
                      'Emosi',
                    ),
                    trailing: DropdownButton(
                      value: _emotion,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listEmotion.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _emotion = newValue!;
                        });
                      },
                    ),
                  ),),
                // const Spacer(),
                ElevatedButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.merahTua,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      int emotionInt;
                      if (_emotion == "Senang") {
                        emotionInt = 1;
                      } else if (_emotion == "Biasa") {
                        emotionInt = 2;
                      } else if (_emotion == "Sedih") {
                        emotionInt = 3;
                      } else {
                        emotionInt = 4;
                      }
                      String dateString = "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                      // Fields newField = new Fields(user: user, date: date, title: _title, emotion: emotionInt, fieldsAbstract: _shortdesc, description: _longdesc);
                      Fields newFields = new Fields(user: 1, date: date, title: _title, emotion: emotionInt, fieldsAbstract: _shortdesc, description: _longdesc);
                      Diary newDiary = new Diary(pk: 1, fields: newFields);
                      ListDiary.list.add(newDiary);
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
                                  Center(child: Text('$newDiary.title')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                      child:
                                      Text('Diary berhasil ditambahkan!')),
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
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
