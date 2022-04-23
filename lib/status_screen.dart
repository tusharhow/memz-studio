import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  static const routeName = '/status';

  const StatusScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('* Pending'),
              Text('* Submitted'),
              Text('* Approved'),
            ],
          ),
        ),
      ),
    );
  }
}
