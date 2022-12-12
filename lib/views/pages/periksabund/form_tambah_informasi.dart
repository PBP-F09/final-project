
part of '_periksabund.dart';

class FormTambahInformasi extends StatefulWidget {
  const FormTambahInformasi({super.key});

  @override
  State<FormTambahInformasi> createState() => _FormTambahInformasiState();
}

class _FormTambahInformasiState extends State<FormTambahInformasi> {
  final _formKey = GlobalKey<FormState>();
  String lokasi = '';
  String tanggal = '';
  String waktu = '';
  String kapasitas_balita = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Informasi'),
          backgroundColor: AppColors.merahMuda,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'RS Pondok Indah',
                          labelText: 'Lokasi',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            lokasi = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            lokasi = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'J';
                          }
                          return null;
                        },
                      ),
                    ),
                                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '12-04-2022',
                          labelText: 'Tanggal',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            tanggal = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            tanggal = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'J';
                          }
                          return null;
                        },
                      ),
                    ),
                                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '20.00 - 21.00',
                          labelText: 'Waktu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            waktu = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            waktu = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'J';
                          }
                          return null;
                        },
                      ),
                    ),
                                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '5',
                          labelText: 'Kapasitas Balita',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            kapasitas_balita = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            kapasitas_balita = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'J';
                          }
                          return null;
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
                      postNote(request, lokasi, tanggal, waktu, kapasitas_balita, request.jsonData['username']);
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
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Data berhasil disimpan!',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Lokasi: $lokasi'),
                                Text('Waktu: $waktu'),
                                Text('Tanggal Tersedia: $tanggal'),
                                Text('Kapasitas Balita: $kapasitas_balita'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.pop(context);
                              // back to page list artikel
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PeriksaBundPage(),
                                ),
                              );
                            },
                            child: const Text('Kembali'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
                    }
                  },
                  
                )
                
                
                  ],
                )),
          ),
        ),
    );
  }
}