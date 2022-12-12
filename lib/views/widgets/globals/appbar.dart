part of '_globals.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageName});

  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      color: AppColors.merahMuda,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Text(
            pageName,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          )
        ],
      ),
    );
  }
}
