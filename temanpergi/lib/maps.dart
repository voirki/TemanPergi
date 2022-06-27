import 'package:flutter/material.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logoTP.png'),
        title: const Text('TemanPergi'),
        backgroundColor: Color.fromARGB(255, 130, 105, 224),
      ),
        body: Center(
      child: Text('Maps'),
    ));
  }
}
