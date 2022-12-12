import 'package:flutter/material.dart';
import 'package:endterm_project/utils/periksabund/_periksabund.dart';
import 'package:endterm_project/models/periksabund/informasi.dart';
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

// class PeriksaBund extends StatefulWidget {
//   const PeriksaBund({super.key});

//   @override
//   State<PeriksaBund> createState() => _PeriksaBundState();
// }

// class _PeriksaBundState extends State<PeriksaBund> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PeriksaBund'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {

//         },
//       ),
//     );
//   }
// }
