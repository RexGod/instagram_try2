import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  static const routeName = '/SaveScreens';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(62, 255, 255, 255),
        elevation: 0,
        title: const Text(
          'Saves',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //body: ,
    );
  }
}
