part of '_globals.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.imageUrl, required this.pageName});

  final String imageUrl;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.creamMuda,
          ),
          child: Image.asset(
            imageUrl,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          pageName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
