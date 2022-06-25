import 'package:flutter/material.dart';
import 'wisata_alam.dart';
import 'wisata_kuliner.dart';
import 'wisata_lainnya.dart';
import 'wisata_seni.dart';
import 'package:simple_slider/simple_slider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WisataAlam())
              );},
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/wisata alam.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WisataKuliner())
              );},
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/wisata kuliner.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WisataSeni())
              );},
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/wisata seni.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WisataLainnya())
              );},
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/wisata lainnya.png'),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}