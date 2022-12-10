part of '_catatbund.dart';

class CatatForm extends StatefulWidget {
  const CatatForm({super.key});

  @override
  State<CatatForm> createState() => _CatatFormState();
}

class ListCatat {
  static List<Catat> list = [];
}

class _CatatFormState extends State<CatatForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  String _date = "2022-12-08";
  String _weight = "";
  String _height = "";
  ListCatat listCatat = new ListCatat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Catatan'),
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
                      hintText: "Masukkan berat badan anak",
                      labelText: "Berat Badan(kg)",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _weight = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _weight = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Berat badan tidak boleh kosong!';
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
                      hintText: "Masukkan tinggi badan anak",
                      labelText: "Tinggi Badan(m)",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _height = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _height = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Tinggi badan tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // const Spacer(),
                ElevatedButton(
                  child: const Text(
                    "Unggah",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.merahTua,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Fields newField = new Fields(user: user, date: date, title: _title, emotion: emotionInt, fieldsAbstract: _shortdesc, description: _longdesc);
                      Catat newCatat = new Catat(pk: 1, user: 1, date: date, weight: _weight, height: _height);
                      ListCatat.list.add(newCatat);
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
                                  Center(child: const Text('Informasi CatatBund')),
                                  Center(child: Text('$newCatat.height')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                      child:
                                      Text('Catatan berhasil ditambahkan!')),
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
                                              builder: (context) => CatatBundPage()),
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