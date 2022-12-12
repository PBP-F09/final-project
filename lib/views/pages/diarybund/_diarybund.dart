import 'package:flutter/material.dart';
import 'package:endterm_project/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:endterm_project/models/diarybund/diary.dart';

import '../../../utils/_utils.dart';
import '../../../utils/diarybund/_diarybund.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/globals/_globals.dart';
import '../authentication/_authentication.dart';

part 'listdiary_page.dart';
part 'form.dart';
part 'diary_details.dart';