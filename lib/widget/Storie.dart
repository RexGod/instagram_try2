import 'package:flutter/material.dart';

class Storie extends StatelessWidget {
  String url;
  String userName;

  Storie(this.url, this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(url),
            radius: 28,
          ),
          Text(
            userName,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
