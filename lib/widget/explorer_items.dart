import 'package:flutter/material.dart';
import '../screen/album_List_Screen.dart';

class ExplorerItems extends StatelessWidget {
  final int id;
  final String urlImage;

  ExplorerItems({required this.id, required this.urlImage});
  void tansferData(BuildContext context) {
    Navigator.of(context).pushNamed(AlbumListScreen.routeName, arguments: {id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => tansferData(context), child: Image.network(urlImage));
  }
}
