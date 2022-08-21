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
    final selectedAlbum = albumSearch.where((element) {
      return albumId == element['Explorer_itemId'];
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 5,
        // ignore: deprecated_member_use
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 100),
                child: Text(
                  selectedAlbum[int.parse(albumId) - 1]['Album_tite'],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Container(
              height: 700,
              width: 400,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 210,
                      childAspectRatio: 1,
                      mainAxisExtent: 145),
                  itemCount: albumSearch.length,
                  itemBuilder: ((context, index) {
                    return AlbumListItem(
                      id: selectedAlbum[index]['id'],
                      urlImage: selectedAlbum[index]['Image_album'],
                      title: selectedAlbum[index]['Album_tite'],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }

  void _setData() async {
    var url2 = Uri.https('6301385a9a1035c7f8ffb7fb.mockapi.io',
        '/instaDUMMYDATA/api/v01/Explorer_items/1/Album_items');
    var response2 = await http.get(url2);
    var jsonResponse2 = convert.jsonDecode(response2.body);

    setState(() {
      albumSearch = jsonResponse2 as List;
      _loading = false;
    });
  }
}
