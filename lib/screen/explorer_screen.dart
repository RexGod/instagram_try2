import 'package:flutter/material.dart';
import '../widget/explorer_item.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ExplorerScreen extends StatefulWidget {
  static const routeName = '/exploreritems';
  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  final searchController = TextEditingController();
  List explorerPhotos = List.empty();
  bool _loading = true;
  
  @override
  void initState() {
    super.initState();
    _setData();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 45, 10, 0),
              height: 35,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(200, 226, 224, 224),
              ),
              child: TextField(
                onChanged: _searchAlbum,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey[900],
                  hintStyle: TextStyle(
                    color: Colors.grey[700],
                  ),
                  hintText: "search album",
                ),
                controller: searchController,
              ),
            ),
            // ignore: sized_box_for_whitespace

            Container(
              height: 550,
              width: 400,
              child: GridViewBuilder(explorerPhotos: explorerPhotos),
            )
          ],
        ),
      ),
    );

    /* Container(
     ,
    ); */
  }

  void _setData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/photos');
    var response = await http.get(url);
    
    // ignore: unrelated_type_equality_checks
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      explorerPhotos = jsonResponse as List;
      _loading = false;
    });
  }

  void _searchAlbum(String inputSearch) {
    final answer = explorerPhotos.where((element) {
      final albumName = element['title'].toString().toLowerCase();
      final input = inputSearch.toLowerCase();
      return albumName.contains(input);
    }).toList();
    setState(() {
      explorerPhotos = answer;
    });
  }
}
