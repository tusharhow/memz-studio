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
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20),
        child: Column(
          children: const [
            Text('To book a photography session do this'),
            Text('To book a photography session do this'),
            Text('To book a photography session do this'),
          ],
        ),
      ),
    );
  }
}
