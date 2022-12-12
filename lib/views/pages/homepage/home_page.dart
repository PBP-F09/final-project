part of '_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.merahMuda,
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 30,
          width: double.infinity,
          color: AppColors.merahMuda,
          child: const Center(
            child: Text(
              'All Rights Reserved. HalowBund <3',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  color: AppColors.merahMuda,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Halow, ${request.jsonData['username']}!',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.merahTua,
                        ),
                        child: IconButton(
                          onPressed: () {
                            print(request.jsonData['username']);
                            logout(request, context);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: const Text(
                      'Bagaimana kondisi Bunda dan Si Kecil hari ini?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.bacaBund,
                          );
                        },
                        child: const CircleIcon(
                          imageUrl: 'assets/images/book_homepage.png',
                          pageName: 'BacaBund',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.tanyaBund,
                          );
                        },
                        child: const CircleIcon(
                          imageUrl: 'assets/images/question_homepage.png',
                          pageName: 'TanyaBund',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.periksaBund,
                          );
                        },
                        child: const CircleIcon(
                          imageUrl: 'assets/images/stetoskop_homepage.png',
                          pageName: 'PeriksaBund',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.diaryBund,
                          );
                        },
                        child: const CircleIcon(
                          imageUrl: 'assets/images/diary_homepage.png',
                          pageName: 'DiaryBund',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.catatBund,
                          );
                        },
                        child: const CircleIcon(
                          imageUrl: 'assets/images/timbangan_homepage.png',
                          pageName: 'CatatBund',
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: const Text(
                      'Teman Bunda Dalam Menemani Si Kecil!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.merahMuda,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset('assets/images/snap_homepage.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Flexible(
                      child: Text(
                        'HalowBund merupakan sebuah aplikasi dan website yang membantu ribuan Ibu di seluruh Indonesia mengenai pengetahuan motherhood dan juga mengedukasi kesehatan Ibu & Anak',
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 1.4),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
