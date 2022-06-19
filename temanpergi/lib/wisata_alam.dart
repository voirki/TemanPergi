import 'package:flutter/material.dart';

class WisataAlam extends StatelessWidget {
  const WisataAlam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/wisata alam.png'),
        title: const Text('Kategori Wisata Alam'),
        backgroundColor:  Color.fromARGB(255, 130, 105, 224),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back),
          ),
          Text('Disini wisata alam'),
        ],
      ),
    );
  }
}