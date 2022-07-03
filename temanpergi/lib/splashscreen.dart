import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    @override
    super.initState();
    splashScreenStart();
  }
}

splashScreenStart() async {
  var duration = Duration(seconds: 3); 
  return Timer(duration,(){ 
    Navigator.of(context).pushReplacement(MaterialPageRoute (builder: (_){
      return Home();
  })); 
});
}

@override
Widget build(BuildContext context) { 
  return Scaffold(
    backgroundColor: Colors.greenAccent, 
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/logoTP.png", height: 250.0,width: 250.0,
          ),
        ],
      ),
    ),
  );
}