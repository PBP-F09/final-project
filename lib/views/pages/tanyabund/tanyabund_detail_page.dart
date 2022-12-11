part of '_tanyabund.dart';

class TanyaBundDetailPage extends HookWidget {
  TanyaBundDetailPage({super.key, required this.data});

  final dynamic data;
  final answerController = TextEditingController();
  Future<List<AnswerModel>> fetchData() async {
    return await fetchAnswerById(data.pk);
  }

  @override
  Widget build(BuildContext context) {
    final totalLike = useState(data.totalLike);
    final totalAnswer = useState(data.totalAnswer);
    final reloadKey = useState(UniqueKey());
    final future = useMemoized(fetchData, [reloadKey.value]);
    final snapshot = useFuture(future);
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                pageName: 'TanyaBund Detail',
              ),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          totalLike.value < 2
                              ? '${totalLike.value} Like'
                              : '${totalLike.value} Likes',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          totalAnswer.value < 2
                              ? '${totalAnswer.value} Answer'
                              : '${totalAnswer.value} Answers',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: AppColors.merahMuda,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 40,
                                      horizontal: 30,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Write your answer here',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Expanded(
                                            child: MultiLineTextField(
                                              label: '',
                                              maxLines: 10,
                                              bordercolor: AppColors.white,
                                              controller: answerController,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            totalAnswer.value =
                                                await createAnswer(
                                              answerController.text,
                                              request.jsonData['pk_user'],
                                              request.jsonData['role_user'],
                                              data.pk,
                                            );
                                            reloadKey.value = UniqueKey();
                                            answerController.clear();
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Send',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
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
                    snapshot.hasData
                        ? ListView.builder(
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
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 150),
                            child: const SpinKitProgressIndicator(),
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
