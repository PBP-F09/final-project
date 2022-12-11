part of '_tanyabund.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.username,
    required this.role,
    required this.datetime,
    required this.text,
  });

  final String username;
  final String role;
  final String datetime;
  final String text;

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
                    '$username',
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
                      '$role',
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
              const Icon(
                Icons.delete,
                size: 20,
                color: Colors.brown,
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
                '$text',
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
