import 'package:flutter/material.dart';
import 'package:memzstudio/status_screen.dart';

class PrevoiusOrders extends StatelessWidget {
  static const routeName = '/pre-order';
  const PrevoiusOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Orders'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Order 1'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(StatusScreen.routeName),
              ),
              OutlinedButton(
                child: const Text('Order 2'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(StatusScreen.routeName),
              ),
              OutlinedButton(
                child: const Text('Order 2'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(StatusScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
