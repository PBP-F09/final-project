import 'package:endterm_project/routes/routes_factory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) { 
          CookieRequest request = CookieRequest();
          return request;
       },
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: (settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => getScreenByName(settings.name!),
          );
        },
      ),
    );
  }
}
