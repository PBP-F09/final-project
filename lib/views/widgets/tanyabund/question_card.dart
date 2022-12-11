part of '_tanyabund.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, this.username, this.role, this.datetime, this.text, this.total_likes, this.total_answers});

  final username;
  final role;
  final datetime;
  final text;
  final total_likes;
  final total_answers;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
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
                          borderRadius: BorderRadius.circular(5)),
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
                Text(
                  '$datetime',
                  style: const TextStyle(color: Colors.grey),
                ),
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
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(width: 4,),
                const Icon(Icons.favorite, size: 20, color: Colors.red,),
                const SizedBox(width: 3,),
                Text('$total_likes'),
                const SizedBox(width: 50,),
                const Icon(Icons.comment, size: 20, color: Colors.black,),
                const SizedBox(width: 3,),
                Text('$total_answers'),
              ],
            )
          ],
        ),
      );
  }
}