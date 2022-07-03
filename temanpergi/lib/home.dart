//https://pub.dev/packages/carousel_slider/example

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'wisata_alam.dart';
import 'wisata_kuliner.dart';
import 'wisata_lainnya.dart';
import 'wisata_seni.dart';

final List<String> imgList = [
  'https://www.goodnewsfromindonesia.id/uploads/post/large-pict-100-tahun-gedung-sate-98fc7fa941f49fc5b656d5edc9536b65.jpg',
  'https://asset.kompas.com/crops/0GiQOXlyFIL68E_gQC4YzU3lyvk=/0x0:1200x800/750x500/data/photo/2019/10/17/5da7fb5e171f6.jpg',
  'https://asset.kompas.com/crops/kw4iPl12YQlIFhdSfni00RPzKpc=/0x49:1000x715/750x500/data/photo/2019/12/26/5e045866d9090.jpg',
  'https://indonesiatraveler.id/wp-content/uploads/2020/06/Bandung-Floating-Market2.jpg',
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logoTP.png'),
        title: const Text('TemanPergi'),
        backgroundColor: Color.fromARGB(255, 130, 105, 224),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 21 / 9,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(item,
                                      fit: BoxFit.cover, width: 500.0),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WisataAlam()));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/wisata alam.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WisataKuliner()));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/wisata kuliner.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WisataSeni()));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/wisata seni.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WisataLainnya()));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/wisata lainnya.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
