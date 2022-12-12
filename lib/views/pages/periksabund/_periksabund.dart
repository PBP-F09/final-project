import 'package:flutter/material.dart';
import 'package:endterm_project/utils/periksabund/_periksabund.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/periksabund/informasi.dart';
import '../../../utils/_utils.dart';

// import 'package:provider/provider.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';

part 'form_tambah_informasi.dart';
part 'table_informasi.dart';
part 'myinformasi.dart';
part 'detail_info.dart';


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
          backgroundColor: AppColors.merahMuda,
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
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: ListTile(
                              title: Text(
                                  snapshot.data![index].lokasi,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              trailing: GestureDetector(
                                child: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailInfo(note: snapshot.data![index]),),);
                                },
                                ),
                            ),
                          ),);
          }
        },
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.merahMuda,
          title: const Text('PeriksaBund'),
        ),
        body: Column(
          children: [
            Center(
                child: Text(
                  'Selamat datang di Halaman Administrator Fasilitas Kesehatan ${request.jsonData['username']} !',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            Expanded(
              child: FutureBuilder(
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
                            itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12,),
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black, blurRadius: 2.0)
                                      ]),
                                  child: ListTile(
                                    title: Text(
                                        snapshot.data![index].lokasi,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    trailing: GestureDetector(
                                      child: Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailInfo(note: snapshot.data![index]),),);
                                      },
                                      ),
                                  ),
                                ),);
                }
              },
                  ),
            ),
          ],
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
