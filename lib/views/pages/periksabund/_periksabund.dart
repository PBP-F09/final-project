import 'package:flutter/material.dart';
import 'package:endterm_project/utils/periksabund/_periksabund.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../utils/_utils.dart';

// import 'package:provider/provider.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';

part 'form_tambah_informasi.dart';
part 'table_informasi.dart';
part 'myinformasi.dart';


class PeriksaBundPage extends StatefulWidget {
  const PeriksaBundPage({super.key});

  @override
  State<PeriksaBundPage> createState() => _PeriksaBundPageState();
}

class _PeriksaBundPageState extends State<PeriksaBundPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    if (request.jsonData['role_user'] == 'Admin' ||
        request.jsonData['role_user'] == 'Bunda') {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PeriksaBund'),
        ),
        body: FutureBuilder(
        future: getNote(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.length == 0) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String lokasi = snapshot.data![index].lokasi;
                String tanggal = snapshot.data![index].tanggal;
                String waktu = snapshot.data![index].waktu;
                int kapasitas_balita = snapshot.data![index].kapasitas_balita;
  
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Halo ${request.jsonData['username']}!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text(
                  'Berikut Informasi kegiatan posyandu & vaksin yang tersedia',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.creamMuda),
                    border: TableBorder.all(
                      width: 1,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    horizontalMargin: 0,
                    columnSpacing: 10,
                    columns: const [
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Lokasi'))),
                      ),
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Tanggal'))),
                      ),
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Waktu'))),
                      ),
                      DataColumn(
                        label: Expanded(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Center(
                              child: Center(child: Text('Kapasitas Balita'))),
                        )),
                      ),
                    ],
                    rows:  [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text(lokasi))),
                          DataCell(Center(child: Text(tanggal))),
                          DataCell(Center(child: Text(waktu))),
                          DataCell(Center(child: Text(kapasitas_balita.toString()))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
                );
              },
            );
          }
        },
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PeriksaBund'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Halaman Administrator Fasilitas Kesehatan ${request.jsonData['username']}!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.creamMuda),
                    border: TableBorder.all(
                      width: 1,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    horizontalMargin: 0,
                    columnSpacing: 10,
                    columns: const [
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Lokasi'))),
                      ),
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Tanggal'))),
                      ),
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Waktu'))),
                      ),
                      DataColumn(
                        label: Expanded(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Center(
                              child: Center(child: Text('Kapasitas Balita'))),
                        )),
                      ),
                      // DataColumn(
                      //   label: Expanded(child: Center(
                      //     child: 
                      //     // TextButton(child : const Text("Delete"),
                      //     // // onPressed: () {
                      //     // //   deleteInfo()
                      //     // // }
                      //     // ),
                      //     )),

                      // ),
                      DataColumn(
                        label: Expanded(child: Center(child: Text('Edit'))),
                      )
                    ],
                    rows: const [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text('RS Siloam Jakarta'))),
                          DataCell(Center(child: Text('2022-01-27'))),
                          DataCell(Center(child: Text('15.00 - 18.00'))),
                          DataCell(Center(child: Text('5'))),
                          DataCell(
                            Center(child: Icon(Icons.remove_circle_outline)),
                          ),
                          DataCell(
                            Center(child: Icon(Icons.edit)),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                              Center(child: Text('RS Pondok Gede Jakarta'))),
                          DataCell(Center(child: Text('2022-01-27'))),
                          DataCell(Center(child: Text('13.00 - 15.00'))),
                          DataCell(Center(child: Text('10'))),
                          
                          DataCell(
                            Center(child: Icon(Icons.remove_circle_outline)),
                          ),
                          DataCell(
                            Center(child: Icon(Icons.edit)),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text('RS Permata Bunda'))),
                          DataCell(Center(child: Text('2022-01-27'))),
                          DataCell(Center(child: Text('13.00 - 15.00'))),
                          DataCell(Center(child: Text('10'))),
                          DataCell(
                            Center(child: Icon(Icons.remove_circle_outline)),
                          ),
                          DataCell(
                            Center(child: Icon(Icons.edit)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormTambahInformasi(),
                ),
              );
            },
            child: const Center(
              child: Text('Tambah Lokasi'),
            ),
          ),
        ),
      );
    }
  }
}
