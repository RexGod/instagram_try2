import 'package:flutter/material.dart';
import '../widget/Storie.dart';
import '../widget/Post.dart';
import '../screen/direct.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void selectrout(BuildContext context) {
    Navigator.of(context).pushNamed('/directMessage');
  }

  static const routeName = '/home';

  List<Storie> stories = [
    Storie('assets/images/andrei-caliman-YIs6K1NEdig-unsplash.jpg', 'zahra'),
    Storie('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'GOD'),
    Storie('assets/images/moise-m-LByIP24-WYc-unsplash.jpg', 'reza'),
    Storie('assets/images/hans-isaacson-Eiei7cTji0U-unsplash.jpg', 'sara'),
    Storie('assets/images/collins-lesulie-rN8YED0SVZA-unsplash.jpg', 'amo'),
    Storie('assets/images/keith-tanner-pXzblCBezww-unsplash.jpg', 'sanaz'),
  ];
  List<Post> posts = [
    Post('reza', 'assets/images/collins-lesulie-rN8YED0SVZA-unsplash.jpg',
        'assets/images/collins-lesulie-rN8YED0SVZA-unsplash.jpg'),
    Post('sanaz', 'assets/images/keith-tanner-pXzblCBezww-unsplash.jpg',
        'assets/images/keith-tanner-pXzblCBezww-unsplash.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(7, 25, 5, 7),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Instagram',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.italic)),
                Transform.rotate(
                  angle: 75,
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () => selectrout(context),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(10, 15.0, 10, 0),
                      child:
                          Storie(stories[index].url, stories[index].userName));
                },
                itemCount: stories.length,
              ),
            ),
            Divider(
              height: 0,
              thickness: 0.7,
              color: Colors.grey[300],
            ),
            Container(
              height: 520,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Post(posts[index].userName, posts[index].avatar,
                      posts[index].media);
                },
                itemCount: posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
