part of '_globals.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
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
    );
  }
}
