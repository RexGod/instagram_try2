import 'package:flutter/material.dart';
import 'package:instagram_try2/screen/Favorite.dart';
import 'package:instagram_try2/screen/Tab.dart';
import 'package:instagram_try2/screen/album_List_Screen.dart';
import 'package:instagram_try2/screen/home.dart';
import 'package:instagram_try2/screen/profile.dart';
import 'package:instagram_try2/screen/explorer_screen.dart';
import 'screen/direct.dart';

void main() => runApp(Instagram());

class Instagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'openSans',
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.purpleAccent,
          canvasColor: Color.fromARGB(216, 248, 246, 246)),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/home': (context) => HomeScreen(),
        '/favoriteScreen': (context) => FavortieScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/exploreritems': (context) => ExplorerScreen(),
        '/directMessage': (context) => Direct(),
        '/AlbumListScreen': (context) => AlbumListScreen(),
      },
    );
  }
}
