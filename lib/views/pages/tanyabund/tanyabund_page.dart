part of '_tanyabund.dart';

class TanyaBundPage extends HookWidget {
  TanyaBundPage({super.key});

  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final reloadKey = useState(UniqueKey());
    final future = useMemoized(fetchQuestion, [reloadKey.value]);
    final snapshot = useFuture(future);
    final request = context.watch<CookieRequest>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.merahMuda,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.merahMuda,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              context: context,
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: 650,
                  decoration: const BoxDecoration(
                    color: AppColors.merahMuda,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'What do you wanna ask, Bund?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Expanded(
                            child: MultiLineTextField(
                              label: '',
                              maxLines: 10,
                              bordercolor: AppColors.white,
                              controller: questionController,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.creamTua,
                          ),
                          onPressed: () async {
                            await createQuestion(
                              questionController.text,
                              request.jsonData['role_user'],
                              request.jsonData['pk_user'],
                            );
                            reloadKey.value = UniqueKey();
                            Navigator.pop(context);
                            showTopFlash(
                                'Successfully created question.', context);
                          },
                          child: const Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 24, color: AppColors.merahTua),
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
        // bottomNavigationBar: Container(
        //   width: double.infinity,
        //   height: 50,
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(200),
        //       topRight: Radius.circular(200),
        //     ),
        //     color: AppColors.merahMuda,
        //   ),
        //   child: GestureDetector(
        //     onTap: () {
        //       showModalBottomSheet(
        //         context: context,
        //         builder: (context) {
        //           return Container(
        //             width: double.infinity,
        //             height: double.infinity,
        //             color: AppColors.merahMuda,
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                 vertical: 40,
        //                 horizontal: 30,
        //               ),
        //               child: Column(
        //                 children: [
        //                   const Text(
        //                     'What do you wanna ask, Bund?',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 10),
        //                     child: Expanded(
        //                       child: MultiLineTextField(
        //                         label: '',
        //                         maxLines: 10,
        //                         bordercolor: AppColors.white,
        //                         controller: questionController,
        //                       ),
        //                     ),
        //                   ),
        //                   ElevatedButton(
        //                     onPressed: () async {
        //                       await createQuestion(
        //                         questionController.text,
        //                         request.jsonData['role_user'],
        //                         request.jsonData['pk_user'],
        //                       );
        //                       reloadKey.value = UniqueKey();
        //                       Navigator.pop(context);
        //                       showTopFlash('Successfully created question.', context);
        //                     },
        //                     child: const Text(
        //                       'Send',
        //                       style: TextStyle(fontSize: 24),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //     child: Center(
        //       child: Container(
        //         padding: EdgeInsets.all(8),
        //         child: const Text(
        //           'Add question',
        //           style: TextStyle(color: AppColors.merahMuda),
        //         ),
        //         color: AppColors.creamMuda,
        //       ),
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(pageName: 'TanyaBund'),
              Expanded(
                child: snapshot.hasData
                    ? ListView.builder(
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
                              ).then((value) => reloadKey.value = UniqueKey());
                            },
                            child: QuestionCard(
                              username: snapshot.data![index].user,
                              role: snapshot.data![index].roleUser,
                              text: snapshot.data![index].text,
                              datetime: DateFormat.yMMMd()
                                  .format(snapshot.data![index].date),
                              totalLikes: snapshot.data![index].totalLike,
                              totalAnswers: snapshot.data![index].totalAnswer,
                            ),
                          );
                        },
                      )
                    : const SpinKitProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
