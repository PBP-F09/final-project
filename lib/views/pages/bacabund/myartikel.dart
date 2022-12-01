import 'package:flutter/material.dart';
import 'package:endterm_project/utils/bacabund/get_artikel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artikel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BacaBund'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getArtikel(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("artikel kosong"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                String tanggal = snapshot.data[index].date.substring(0, 10);
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(tanggal),
                  ),
                );
              },
            );
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
