import 'package:flutter/material.dart';
import 'package:instagram_try2/screen/Favorite.dart';
import 'package:instagram_try2/screen/Save_Screen.dart';
import 'package:instagram_try2/screen/Tab.dart';
import 'package:instagram_try2/screen/albumImageScreen.dart';
import 'package:instagram_try2/screen/home.dart';
import 'package:instagram_try2/screen/profile.dart';
import 'screen/album_List_Screen.dart';
import 'screen/direct.dart';
import 'screen/explorer.dart';


void main() => runApp(Instagram());

class Instagram extends StatelessWidget {
/*   final List<Map<String, String>> SavePost = [];
  void _toggle(String id) {
    final index = SavePost.indexWhere((element) => id == element['']);
    if(index>= 0){

    }
  } */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'openSans',
          accentColor: Colors.purpleAccent,
          canvasColor: const Color.fromARGB(216, 248, 246, 246)),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/home': (context) => HomeScreen(),
        '/favoriteScreen': (context) => FavortieScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/explorerScreen': (context) => ExplorerScreen(),
        '/directMessage': (context) => Direct(),
        '/AlbumListScreen': (context) => AlbumListScreen(),
        '/AlbumImage': (context) => AlbumImage(),
        '/SaveScreens': (context) => SaveScreen(),
      },
    );
  }
}
