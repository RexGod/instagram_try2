import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widget/album_list_item.dart';

class AlbumListScreen extends StatefulWidget {
  static const routeName = '/AlbumListScreen';

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List albumSearch = List.empty();
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
    final routeArg = ModalRoute.of(context)?.settings.arguments;
    final albumId = routeArg.toString();
    final title = albumSearch[int.parse(albumId) - 1]['title'].toString();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(title),
          ),
          /* Container(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150, childAspectRatio: 1),
                itemCount: albumSearch.length,
                itemBuilder: ((context, index) {
                  return AlbumListItem(id: albumSearch[index]['id']);
                })),
          ) */
        ],
      ),
    );
  }

  void _setData() async {
    var url2 = Uri.https('jsonplaceholder.typicode.com', '/albums');
    var response2 = await http.get(url2);
    var jsonResponse2 = convert.jsonDecode(response2.body);

    setState(() {
      albumSearch = jsonResponse2 as List;
      _loading = false;
    });
  }
}
