import 'package:flutter/material.dart';

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
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/wisata alam.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/wisata kuliner.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/wisata seni.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/wisata lainnya.png'),
            ),
          ),
        ],
      ),
      )
    );
  }
}