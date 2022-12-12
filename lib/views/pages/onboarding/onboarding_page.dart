part of '_onboarding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.merahPink,
      body: SafeArea(
        child: Stack(
          children: [
            CircleBubble(widthScreen: width, dx: 0.7, dy: 0.4, radius: 80),
            CircleBubble(widthScreen: width, dx: 1, dy: 0.2, radius: 150),
            CircleBubble(widthScreen: width, dx: -0.5, dy: 0.6, radius: 150),
            CircleBubble(widthScreen: width, dx: -0.1, dy: 0.4, radius: 90),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 290),
              child: const Text(
                'HalowBund!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 100),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.login,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.creamMuda,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.merahTua,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
