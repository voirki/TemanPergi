import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/logoTP.png',
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit:BoxFit.cover
            ),
            Container(  
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Tentang Aplikasi TemanPergi',
                style: TextStyle(
                  color: Color.fromARGB(255, 130, 105, 224),
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
              )
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10),
              child: Text(
                'Aplikasi TemanPergi adalah aplikasi pariwisata yang memuat seluruh informasi pariwisata di Wilayah Bandung Raya, Provinsi Jawa Barat, yang mencakup Kota Bandung, Kota Cimahi, Kabupaten Bandung, Kabupaten Bandung Barat, dan Kabupaten Sumedang. Aplikasi ini membutuhkan pengembangan lebih lanjut agar lebih layak digunakan oleh turis. Semoga aplikasi ini menjadi langkah awal untuk digitalisasi pariwisata di Wilayah Bandung Raya.'
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10),
              child: Text(
                'Aplikasi ini dibangun untuk menyelesaikan Tugas Besar Aplikasi Berbasis Platform IF-43-05 Universitas Telkom. Aplikasi ini dibangun oleh Kelompok 2: Igga Febrian Virgiani (1301194283), Naufal Yozha Revansyah (1301194282), Manuel Benedict (1301194182), dan Tsaqib Sayyidan Sendjaja (1301193450).',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Copyright TemanPergi 2022',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ]
        )
      )
    );
  }
}
//disuruh igga