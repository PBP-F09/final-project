part of '_tanyabund.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.username,
    required this.role,
    required this.datetime,
    required this.text,
    this.request,
    required this.answerId,
    required this.notifyParent,
  });

  final String username;
  final String role;
  final String datetime;
  final String text;
  final request;
  final int answerId;
  final Function() notifyParent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.creamMuda,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.account_circle_sharp,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    username,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.merahTua,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      role,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              if (username == request.jsonData['username'] || request.jsonData['role_user'] == 'Admin')
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.brown,
                  ),
                  onPressed: () async {
                    final res = await deleteAnswer(
                      request.jsonData['pk_user'],
                      request.jsonData['role_user'],
                      answerId,
                    );
                    // ignore: use_build_context_synchronously
                    showTopFlash('Successfully deleted answer.', context);
                    notifyParent();
                  },
                )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Flexible(
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Replied at $datetime',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
