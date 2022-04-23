import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = '/help';
  const HelpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 30,
          //     right: 30,
          //     left: 20,
          //   ),
          //   child: Image.asset(
          //     "assets/images/menu.png",
          //     height: 40,
          //     width: 40,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 30,
              left: 100,
            ),
            child: Image.asset(
              "assets/images/he.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 200,
              right: 30,
              left: 170,
            ),
            child: Text(
              'Help',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0, left: 20),
            child: Column(
              children: const [
                Text('To book a photography session do this'),
                Text('To book a photography session do this'),
                Text('To book a photography session do this'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
