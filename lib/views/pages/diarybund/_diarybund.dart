import 'package:flutter/material.dart';
import 'package:endterm_project/main.dart';
import 'package:endterm_project/views/pages/diarybund/form.dart';
import 'package:flutter/material.dart';

class DiaryBundPage extends StatefulWidget {
  const DiaryBundPage({super.key});

  @override
  State<DiaryBundPage> createState() => _DiaryBundPageState();
}

class _DiaryBundPageState extends State<DiaryBundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiaryBund'),
      ),
      // drawer: makeDrawer(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DiaryForm()),
              );
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ListDiary.list[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          ListDiary.list[index].date,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ListDiary.list[index].shortdesc.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          ListDiary.list[index].emotion,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: ListDiary.list.length,
      ),
    );
  }
}
