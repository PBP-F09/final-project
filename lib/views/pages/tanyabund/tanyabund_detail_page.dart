part of '_tanyabund.dart';

class TanyaBundDetailPage extends HookWidget {
  const TanyaBundDetailPage({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final totalLike = useState(data.totalLike);
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(pageName: 'TanyaBund Detail',),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle_sharp,
                          size: 55,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.user}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: AppColors.merahTua,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                '${data.roleUser}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data.text}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Posted at: ${DateFormat.yMMMd().format(data.date)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data.totalLike < 2
                              ? '${totalLike.value} Like'
                              : '${totalLike.value} Likes',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data.totalAnswer < 2
                              ? '${data.totalAnswer} Answer'
                              : '${data.totalAnswer} Answers',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          color: Colors.red,
                          onPressed: () async {
                            totalLike.value = await likeQuestion(data.pk);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment),
                          color: Colors.black,
                          onPressed: () {
                            print('test');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.brown,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Answers:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      child: FutureBuilder(
                        future: fetchAnswerById(data.pk),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                                child: CircularProgressIndicator());
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
                                primary: false,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) {
                                  return AnswerCard(
                                    username: snapshot.data![index].user,
                                    role: snapshot.data![index].roleUser,
                                    text: snapshot.data![index].text,
                                    datetime: DateFormat.yMMMd()
                                        .format(snapshot.data![index].date),
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
            ],
          ),
        ),
      ),
    );
  }
}
