import 'package:flutter/material.dart';
import '../screen/album_List_Screen.dart';

class ExplorerItems extends StatelessWidget {
  final String id;
  final String urlImage;
  final String title;
  ExplorerItems(
      {required this.id, required this.urlImage, required this.title});
  void tansferData(BuildContext context) {
    Navigator.of(context).pushNamed(AlbumListScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => tansferData(context),
        child: Stack(
          children: [
            Image.network(
              urlImage,
              width: 200,
              height: 200,
            ),
            Positioned(
              top: 30,
              right: 30,
              left: 30,
              child: Text(
                title,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  backgroundColor: Colors.grey[800],
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
