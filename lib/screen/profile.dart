import 'package:flutter/material.dart';
import 'package:instagram_try2/screen/Save_Screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profileScreen';
  void tansferData(BuildContext context) {
    Navigator.of(context).pushNamed(
      SaveScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(193, 255, 255, 255),
          elevation: 1,
          foregroundColor: Colors.black,
          title: const Text('RexlyGod'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      builder: (context) => ListView(
                            children: [
                              const ListTile(
                                leading: Icon(Icons.settings),
                                title: Text(
                                  'Settings',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                //onTap: () {},
                              ),
                              ListTile(
                                leading: const Icon(Icons.bookmark_border),
                                title: const Text(
                                  'Saves',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onTap: () => tansferData(context),
                              )
                            ],
                          ));
                },
                icon: const Icon(Icons.menu))
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(46, 179, 177, 177),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(125, 255, 255, 255),
                      foregroundColor: Colors.black,
                      radius: 25,
                      child: Icon(Icons.person),
                    ),
                    Column(
                      children: const [Text('0'), Text('POST')],
                    ),
                    Column(children: const [Text('0'), Text('Follower')]),
                    Column(children: const [Text('0'), Text('Following')]),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Column(
              children: const [Icon(Icons.hourglass_empty), Text('Is Empty')],
            ),
          ),
        ],
      ),
    );
  }
}
