import 'package:flutter/material.dart';

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);

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
      body: Center(
        child: Text('Places'),
      )
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