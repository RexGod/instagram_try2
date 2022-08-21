import 'package:flutter/material.dart';
import './profile.dart';
import './explorer.dart';
import './Favorite.dart';
import './home.dart';

// ignore: use_key_in_widget_constructors
class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': HomeScreen()},
    {'page': ExplorerScreen()},
    {'page': FavortieScreen()},
    {'page': ProfileScreen()},
  ];
  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            onTap: _selectPage,
            elevation: 20,
            backgroundColor: Theme.of(context).canvasColor,
            // ignore: deprecated_member_use
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color.fromARGB(255, 158, 158, 156),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 25,
            currentIndex: _selectPageIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: ''),
              _selectPageIndex == 2
                  ? const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: '')
                  : const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border), label: ''),
              _selectPageIndex == 3
                  ? const BottomNavigationBarItem(
                      icon: CircleAvatar(
                        child: Icon(Icons.person),
                        foregroundColor: Colors.black,
                        backgroundColor: Color.fromARGB(137, 248, 246, 246),
                      ),
                      label: '')
                  : const BottomNavigationBarItem(
                      icon: CircleAvatar(
                        child: Icon(Icons.person),
                        foregroundColor: Colors.grey,
                        backgroundColor: Color.fromARGB(137, 248, 246, 246),
                      ),
                      label: '')
              // const BottomNavigationBarItem(icon: Icon(Icons.star), label: '')
            ]),
      ),
    );
  }
}
