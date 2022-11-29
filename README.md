# *HalowBund*

## Deskripsi Aplikasi
HalowBund merupakan sebuah aplikasi yang dapat membantu ribuan Ibu di seluruh Indonesia mengenai pengetahuan *motherhood* dan juga mengedukasi kesehatan Ibu & Anak di Indonesia. Pada aplikasi ini, Ibu dapat membaca artikel-artikel mengenai pengetahuan keibuan dan juga mengajukan pertanyaan terkait kehamilan dan tumbuh-kembang anak pada forum diskusi dengan berinteraksi dengan dokter spesialis, perawat, atau Ibu lainnya. Selain itu, Ibu juga dapat mencari informasi terkait tempat dan waktu dilaksanakannya kegiatan posyandu dan imunisasi di lingkungan terdekatnya.

Fitur yang kami kembangkan juga dapat menjembatani kepentingan tenaga kesehatan seperti dokter spesialis anak & kandungan serta perawat dalam memberikan informasi yang akurat dengan menjawab pertanyaan-pertanyaan terkait tumbuh-kembang anak yang diberikan oleh Ibu.

## Daftar Modul
1. Login dan Register
2. Home
3. BacaBund - Iqbal<br>
Pada fitur ini, pengguna dapat melihat artikel yang telah diupload oleh Admin. Selain itu, Admin juga dapat menambahkan artikel baru. 
4. CatatBund - Varas<br>
Pada fitur ini, pengguna dapat mencatat tinggi dan berat badan untuk melihat perkembangan buah hati. Fitur ini juga dilengkapi perhitungan BMI otomatis.
5. DiaryBund - Mayfa<br>
Pada fitur ini, pengguna dapat menceritakan dan mendokumentasikan kegiatan sehari-harinya dengan sang anak
6. PeriksaBund - Shafa<br>
Pada fitur ini, pengguna dapat melihat informasi mengenai lokasi posyandu atau tempat fasilitas untuk melakukan imunisasi dan vaksin.
7. TanyaBund - Fadhlan<br>
Pada fitur ini, pengguna dapat mengajukan pertanyaan dan menjawab pertanyaan secara publik layaknya sebuah forum.

## Alur Pengintegrasian dengan _Web Service_
1. Mendefinisikan model yang akan digunakan saat pemanggilan web service, beserta method toJson() dan fromJson().
2. Menambahkan dependensi http pada proyek aplikasi, serta menambahkan potongan kode untuk memperbolehkan akses internet pada aplikasi Flutter di file android/app/src/main/AndroidManifest.xml.
3. Melakukan fetch data dengan hit endpoint API menggunakan method POST, GET, DELETE, PUT, dan lain-lain yang disediakan dependensi http.
4. Data yang sudah di-fetch kemudian di-decode menjadi bentuk JSON.
5. Data dalam bentuk JSON dikonversi menjadi data dalam bentuk sebuah model.
6. Data dalam bentuk model tersebut ditampilkan pada aplikasi Flutter.


## Persona
- Admin
    - Mengatur database 
    - Melakukan perubahan dan pembaruan fitur pada aplikasi
    - Mengunggah konten artikel pada aplikasi
    - Melihat konten aplikasi
- Masyarakat (Ibu Hamil & Ibu yang Mempunyai Anak)
    - Melihat konten artikel pada aplikasi
    - Berinteraksi dengan pengguna (Ibu) lainnya dalam membahas topik-topik yang berkaitan dengan Kehamilan atau Tumbuh-Kembang Anak
    - Memberikan pertanyaan-pertanyaan kepada Dokter Spesialis
    - Melihat konten aplikasi
    - Menggunakan fitur CatatBund (untuk mendokumentasikan tumbuh kembang Anak) dan DiaryBund (untuk mendokumentasikan keseharian Ibu dan Anak)
- Fasilitas Kesehatan (Dokter Spesialis Kandungan & Anak, Perawat)
    - Menjawab pertanyaan-pertanyaan dari Ibu 
    - Melihat konten aplikasi
    - Menambahkan informasi lokasi posyandu dan vaksin

## Anggota Kelompok
1. Diona Varastika - 2106708255
2. Fadhlan Hasyim - 2106652215
3. Iqbal Pahlevi Amin - 2106752281
4. Shafa Najwa Nathania - 2106634414
5. Mayfa Shadrina Siddi - 2106634616
