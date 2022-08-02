import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  String userName;
  String avatar;
  String media;
  Post(this.userName, this.avatar, this.media);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 0, 10, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 18,
                      ),
                    ),
                    Text(userName),
                  ],
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          Image(image: AssetImage(media)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.chat_bubble_outline_rounded),
                    ),
                    Icon(Icons.send_rounded),
                  ],
                ),
                const Icon(Icons.bookmark_border)
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0.0, 2),
                child: Row(
                  children: [
                    Text('1001 likes ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[850],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: prefer_interpolation_to_compose_strings
                    Text(
                      userName + ' : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[850],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
