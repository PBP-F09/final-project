part of '_globals.dart';

class SpinKitProgressIndicator extends StatelessWidget {
  const SpinKitProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? AppColors.creamTua : AppColors.merahTua,
          ),
        );
      },
    );
  }
}
