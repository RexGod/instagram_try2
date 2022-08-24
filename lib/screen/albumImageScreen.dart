import 'package:flutter/material.dart';

class AlbumImage extends StatelessWidget {
  static const routeName = '/AlbumImage';

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // ignore: non_constant_identifier_names
    final ImagePost = routeArg['image'].toString();
    final titles = routeArg['title'].toString();
    //final caption = routeArg['caption'].toString();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(50, 248, 246, 246),
          elevation: 0,
          // ignore: deprecated_member_use
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(titles)
                ],
              ),
            ),
            Image.network(
              ImagePost,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$titles : ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      /* Container(
                        width: 170,
                        child: Text(
                          caption,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(),
                        ),
                      ), */
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border)),
                ],
              ),
            ),
          ],
        ));
  }
}
