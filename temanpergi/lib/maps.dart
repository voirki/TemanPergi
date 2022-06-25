/*
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
    options: MapOptions(
      center: LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/styles/v1/vivibaskara/cl24vvrlw000c14lzp62j76tp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml2aWJhc2thcmEiLCJhIjoiY2wxeW12azNqMGU4aDNscXJhZWx0cmw1MSJ9.YlXMaBPoY66jbPS90ANRXg",
        additionalOptions: {
          'accessToken' : 'pk.eyJ1Ijoidml2aWJhc2thcmEiLCJhIjoiY2wxeW12azNqMGU4aDNscXJhZWx0cmw1MSJ9.YlXMaBPoY66jbPS90ANRXg' 
          'id' : 'mapbox.mapbox-streets-v8'
      ),
      /*MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(51.5, -0.09),
            builder: (ctx) =>
            Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    
  );
    );

        
  }
}
*/