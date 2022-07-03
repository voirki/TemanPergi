import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final List<String> imgList = [
  'https://www.goodnewsfromindonesia.id/uploads/post/large-pict-100-tahun-gedung-sate-98fc7fa941f49fc5b656d5edc9536b65.jpg',
  'https://asset.kompas.com/crops/0GiQOXlyFIL68E_gQC4YzU3lyvk=/0x0:1200x800/750x500/data/photo/2019/10/17/5da7fb5e171f6.jpg',
  'https://asset.kompas.com/crops/kw4iPl12YQlIFhdSfni00RPzKpc=/0x49:1000x715/750x500/data/photo/2019/12/26/5e045866d9090.jpg',
  'https://indonesiatraveler.id/wp-content/uploads/2020/06/Bandung-Floating-Market2.jpg',
];

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);

  final String url = 'http://10.0.2.2:8000/api/web/places';

  Future getPlaces() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logoTP.png'),
        title: const Text('TemanPergi'),
        backgroundColor: Color.fromARGB(255, 130, 105, 224),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: CustomSearchDelegate(),);
            },
          ),
        ],
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
          /*FutureBuilder(
            future: getPlaces(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                return ListView.builder(
                  itemCount: data[index],
                  itemBuilder: (context, index){
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Text(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text('Data Error');
              }
            },
          ),*/
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];
  
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];

    for (var searched in searchTerms){
      if (searched.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];

    for (var searched in searchTerms){
      if (searched.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}