import 'package:flutter/material.dart';
import '../screen/album_List_Screen.dart';

// ignore: camel_case_types
class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    Key? key,
    required this.explorerPhotos,
  }) : super(key: key);
  final List explorerPhotos;

  void transfer(BuildContext contxt) {
    Navigator.of(contxt).pushNamed(AlbumListScreen.routeName,
        //arguments: {'id': }
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => transfer(context),
      child: GridView.builder(
        itemBuilder: (context, index) {
          var photo = explorerPhotos[index];
          return Image.network(photo['thumbnailUrl']);
        },
        itemCount: explorerPhotos.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 1,
        ),
      ),
    );
  }
}
