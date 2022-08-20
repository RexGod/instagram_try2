import 'package:flutter/material.dart';

import '../screen/albumImageScreen.dart';

class AlbumListItem extends StatelessWidget {
  final int id;
  AlbumListItem({required this.id});
  
   void tansferData(BuildContext context) {
    Navigator.of(context).pushNamed(AlbumImage.routeName, arguments: id);
  } 
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => tansferData(context));
  }
}

