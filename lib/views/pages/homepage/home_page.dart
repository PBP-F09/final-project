part of '_homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    MyHomePage(
      title: 'test',
    ),
    MyHomePage(
      title: 'title',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              15,
            ),
            topLeft: Radius.circular(
              15,
            ),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              15,
            ),
            topRight: Radius.circular(
              15,
            ),
          ),
          child: FlashyTabBar(
            selectedIndex: _selectedIndex,
            showElevation: true,
            onItemSelected: (index) => (setState(
              () {
                _selectedIndex = index;
              },
            )),
            items: [
              FlashyTabBarItem(
                icon: const Icon(Icons.library_books_outlined),
                title: const Text('Baca'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.book),
                title: const Text('Catat'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.child_care),
                title: const Text('Diary'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.search),
                title: const Text('Periksa'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.question_answer_outlined),
                title: const Text('Tanya'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
