import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AlbumListScreen extends StatefulWidget {
  static const routeName = '/AlbumListScreen';

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List albumSearch = List.empty();
  @override
  void initState() {
    super.initState();
    _setData();
  }

  @override
  Widget build(BuildContext context) {
    final albumId = ModalRoute.of(context)?.settings.arguments;
    //final selectAlbum = albumSearch.firstWhere((ele) => albumId == ele['id']);
    return Scaffold(
      appBar: AppBar(
          //title: Text(selectAlbum['title']),
          ),
    );
  }

  void _setData() async {
    var url2 = Uri.https('jsonplaceholder.typicode.com', '/albums');
    var response2 = await http.get(url2);
    var jsonResponse2 = convert.jsonDecode(response2.body);
    setState(() {
      albumSearch = jsonResponse2 as List;
    });
  }
}
