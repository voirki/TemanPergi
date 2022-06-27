import 'home.dart';
import 'places.dart';
import 'maps.dart';
import 'about.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String judul = 'TemanPergi';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: judul,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

final bodies = [Home(), Places(), Maps(), About()];
int sel = 0;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  var menu = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.place),
      label: 'Places',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Maps',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.web),
      label: 'About',
    ),
  ];

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
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: menu,
        selectedItemColor: Color.fromARGB(255, 130, 105, 224),
        unselectedItemColor: Colors.black,
        currentIndex: sel,
        onTap: (int index) {
          if (index != sel) {
            setState(() {
              sel = index;
            });
          }
        },
      ),
      body: bodies.elementAt(sel),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var searched in searchTerms) {
      if (searched.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var searched in searchTerms) {
      if (searched.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searched);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
