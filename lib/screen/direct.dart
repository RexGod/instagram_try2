// ignore_for_file: prefer_const_constructors
import '../widget/chat.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Direct extends StatefulWidget {
  @override
  State<Direct> createState() => _DirectState();
}

class _DirectState extends State<Direct> {
  final searchController = TextEditingController();
  List<Chat> chats = chatBox;
  static const routName = '/directMessage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'ibarra'),
        home: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    IconButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Icon(Icons.add)
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 50,
                child: Card(
                  child: TextField(
                    onChanged: searching,
                    decoration: InputDecoration(
                      hintText: 'search',
                      prefixIcon: IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.search),
                      ),
                    ),
                    controller: searchController,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Message',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text('request',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                height: 650,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Chat(chats[index].url, chats[index].userName));
                  },
                  itemCount: chats.length,
                ),
              ),
            ],
          ),
        )));
  }

  //searching methode
  /* using where method for select item in argument list */
  void searching(String query) {
    final suggest = chatBox.where((chat) {
      final usersName = chat.userName.toLowerCase();
      final input = query.toLowerCase();

      return usersName.contains(input);
    }).toList();

    setState(() => chats = suggest);
  }
}
