import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../widget/explorer_items.dart';

class ExplorerScreen extends StatefulWidget {
  static const routeName = '/explorerScreen';

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  final searchController = TextEditingController();
  List explorerPhotos = List.empty();
  List explorerPhotostemp = List.empty();
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
              margin: const EdgeInsets.fromLTRB(10, 80, 10, 0),
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
            Container(
              width: 400,
              height: 620,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 195,
                    childAspectRatio: 1,
                    mainAxisExtent: 99),
                itemBuilder: ((context, index) {
                  return ExplorerItems(
                    id: explorerPhotos[index]['id'],
                    urlImage: explorerPhotos[index]['Image'],
                    title: explorerPhotos[index]['titles'],
                  );
                }),
                itemCount: explorerPhotos.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setData() async {
    var url = Uri.https('6301385a9a1035c7f8ffb7fb.mockapi.io',
        '/instaDUMMYDATA/api/v01/Explorer_items');
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      explorerPhotos = jsonResponse as List;
      explorerPhotostemp = explorerPhotos;
      _loading = false;
    });
  }

  void _searchAlbum(String inputSearch) {
    final answer = explorerPhotostemp.where((element) {
      final albumName = element['titles'].toString().toLowerCase();
      final input = inputSearch.toLowerCase();
      return albumName.contains(input);
    }).toList();
    setState(() {
      explorerPhotos = answer;
    });
  }
}
