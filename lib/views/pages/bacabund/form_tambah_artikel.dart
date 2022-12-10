part of '_bacabund.dart';

class FormTambahArtikel extends StatefulWidget {
  const FormTambahArtikel({super.key});

  @override
  State<FormTambahArtikel> createState() => _FormTambahArtikelState();
}

class _FormTambahArtikelState extends State<FormTambahArtikel> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _body = '';
  String _date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Artikel Baru'),
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
                          hintText: 'Contoh: Penyakit Ibu Hamil',
                          labelText: 'Judul Artikel',
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
                            return 'Judul artikel tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Isi artikel',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        onChanged: (String? value) {
                          setState(() {
                            _body = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _body = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Isi artikel tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(left: 30.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(20.0),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  _date = DateTime.now().toString().substring(0, 10);
                });
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
                                Text('Judul: $_title'),
                                Text('Isi: $_body.substring(0, 30)'),
                                Text('Tanggal: $_date'),
                              ],
                            )),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
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
            child: const Text(
              'Simpan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}