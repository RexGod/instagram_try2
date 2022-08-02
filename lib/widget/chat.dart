import 'package:flutter/material.dart';
class Chat extends StatelessWidget {
  String url;
  String userName;
  Chat(this.url, this.userName);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(235, 248, 246, 246),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(url),
                  ),
                ),
                Text(
                  userName,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Icon(Icons.camera_alt)
          ],
        ),
      ),
    );
  }
}
  List<Chat> chatBox = [
    Chat('assets/images/hans-isaacson-Eiei7cTji0U-unsplash.jpg', 'reza'),
    Chat('assets/images/andrei-caliman-YIs6K1NEdig-unsplash.jpg', 'hossein'),
    Chat('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'daredevile'),
    Chat('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'punisher'),
    Chat('assets/images/moise-m-LByIP24-WYc-unsplash.jpg', 'karen page'),
    Chat('assets/images/hans-isaacson-Eiei7cTji0U-unsplash.jpg', 'shadmehr'),
    Chat('assets/images/collins-lesulie-rN8YED0SVZA-unsplash.jpg', 'thur'),
    Chat('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'spider man'),
    Chat('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'spider man'),
    Chat('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'spider man'),
  ];