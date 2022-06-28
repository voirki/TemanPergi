import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

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
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(-6.97301830962818, 107.63035165414249),
          zoom: 10,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://api.mapbox.com/styles/v1/vivibaskara/cl1ymzv54002j14jx1rldk8pq/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml2aWJhc2thcmEiLCJhIjoiY2wxeW12azNqMGU4aDNscXJhZWx0cmw1MSJ9.YlXMaBPoY66jbPS90ANRXg',
            additionalOptions: {
              'accessToken': 'pk.eyJ1Ijoidml2aWJhc2thcmEiLCJhIjoiY2wxeW12azNqMGU4aDNscXJhZWx0cmw1MSJ9.YlXMaBPoY66jbPS90ANRXg',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
        ],
      ),
    );
  }
}
