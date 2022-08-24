import 'package:flutter/material.dart';

import '../screen/albumImageScreen.dart';

class AlbumListItem extends StatelessWidget {
  final int id;
  final String urlImage;
  final String title;

  AlbumListItem({
    required this.id,
    required this.urlImage,
    required this.title,
  });

  void tansferData(BuildContext context) {
    Navigator.of(context).pushNamed(AlbumImage.routeName, arguments: {
      //'id': id,
      'image': urlImage,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => tansferData(context),
        child: Stack(children: [
          Image.network(urlImage),
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
        ]));
  }
}
