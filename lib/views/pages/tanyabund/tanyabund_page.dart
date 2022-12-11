part of '_tanyabund.dart';

class TanyaBundPage extends StatefulWidget {
  const TanyaBundPage({super.key});

  @override
  State<TanyaBundPage> createState() => _TanyaBundPageState();
}

class _TanyaBundPageState extends State<TanyaBundPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.merahMuda,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(pageName: 'TanyaBund'),
              Expanded(
                child: FutureBuilder(
                  future: fetchQuestion(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data.length == 0) {
                        return Column(
                          children: const [
                            Text(
                              'Tidak ada to do list :(',
                              style: TextStyle(
                                  color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TanyaBundDetailPage(
                                      data: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: QuestionCard(
                                username: snapshot.data![index].user,
                                role: snapshot.data![index].roleUser,
                                text: snapshot.data![index].text,
                                datetime: DateFormat.yMMMd()
                                    .format(snapshot.data![index].date),
                                total_likes: snapshot.data![index].totalLike,
                                total_answers:
                                    snapshot.data![index].totalAnswer,
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
