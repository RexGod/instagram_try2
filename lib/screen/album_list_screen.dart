import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widget/album_list_item.dart';

// ignore: use_key_in_widget_constructors
class AlbumListScreen extends StatefulWidget {
  static const routeName = '/AlbumListScreen';

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List albumSearch = List.empty();
  List albumphoto = [];
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
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final albumId = routeArg['id'].toString();
    final selectedAlbum = albumSearch.where((element) {
      return element['id'].toString().contains(albumId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAlbum[int.parse(albumId) - 1]['title']),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        // ignore: deprecated_member_use
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 700,
        width: 400,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                mainAxisExtent: 200),
            itemCount: albumSearch.length,
            itemBuilder: ((context, index) {
              print(albumSearch.length);
              return AlbumListItem(
                id: selectedAlbum[index]['id'],
                urlImage: albumphoto[index]['url'],
                title: selectedAlbum[index]['title'],
              );
            })),
      )),
    );
  }

  void _setData() async {
    var url2 = Uri.https('jsonplaceholder.typicode.com', '/albums');
    var response2 = await http.get(url2);
    var jsonResponse2 = convert.jsonDecode(response2.body);
    var url = Uri.https('jsonplaceholder.typicode.com', '/photos');
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      albumSearch = jsonResponse2 as List;
      albumphoto = jsonResponse as List;
      _loading = false;
    });
  }
}
