part of '_bacabund.dart';

class DetailArtikel extends StatefulWidget {
  var title;
  var body;
  var author;
  var date;
  DetailArtikel({
    this.title,
    this.body,
    this.author,
    this.date,
  });

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Artikel')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: SingleChildScrollView(
                child: Text(widget.body),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Created: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(widget.date),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: const Size.fromHeight(40), // NEW
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
