part of '_diarybund.dart';

class DiaryDetails extends StatelessWidget {
  // final Diary diary;
  // const DiaryDetails({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DiaryBund'),
          backgroundColor: AppColors.merahMuda,
        ),
        // drawer: makeDrawer(context),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Padding (
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ini tanggal',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Adek tiba-tiba demam',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Chip(
                        label: Text('Sedih'),
                        labelStyle: TextStyle(color: AppColors.merahTua),
                        backgroundColor: AppColors.creamTua,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      'Hari ini adek tiba-tiba demam, batuk, dan muntah-muntah. Sepertinya dia keracunan makanan 0_O',
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic, color: AppColors.merahMuda),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.merahTua,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),),
        ));
  }
}