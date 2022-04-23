import 'package:flutter/material.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/customer_drawer.dart';
import 'package:memzstudio/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const CustomerDrawerScreen(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              child: const Text('Photography'),
              onPressed: () =>
                  Navigator.of(context).pushNamed(BookinScreen.routeName),
            ),
            OutlinedButton(
              child: const Text('Videography'),
              onPressed: () =>
                  Navigator.of(context).pushNamed(BookinScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
