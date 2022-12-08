import 'package:endterm_project/main.dart';
import 'package:endterm_project/views/pages/diarybund/form.dart';
import 'package:flutter/material.dart';

class DiaryForm extends StatefulWidget {
  const DiaryForm({super.key});

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

// class DiaryBund(models.Model):
//     user = models.ForeignKey(User, on_delete=models.CASCADE)
//     date = models.DateField()
//     title = models.CharField(max_length=200)
//     emotion = models.IntegerField()
//     abstract = models.CharField(max_length=200)
//     description = models.TextField()

class Diary {
  String title = "";
  String shortdesc = "";
  String longdesc = "";
  String emotion = "";
  String date = "";

  Diary(String _title, String _short_desc, String _long_desc, String _emotion,
      String _date) {
    title = _title;
    shortdesc = _short_desc;
    longdesc = _long_desc;
    emotion = _emotion;
    date = _date;
  }
}

class ListDiary {
  static List<Diary> list = [];
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  // String _title = "";
  // int _nominal = 0;
  // String _jenisBudget = 'Senang';
  String _title = "";
  String _shortdesc = "";
  String _longdesc = "";
  String _emotion = 'Senang';
  String _date = "";
  List<String> listEmotion = ['Senang', 'Sedih', 'Marah', 'Biasa'];
  ListDiary listDiary = new ListDiary();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Diary'),
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
                    children: [
                      Text('${date.day}/${date.month}/${date.year}'),
                      ElevatedButton(
                        child: Text('Pilih Hari'),
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
                            _date = '${date.day}/${date.month}/${date.year}';
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
                ),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Diary newDiary = new Diary(
                          _title, _shortdesc, _longdesc, _emotion, _date);
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
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                      child:
                                          Text('Diary berhasil ditambahkan!')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
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
