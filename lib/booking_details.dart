import 'package:flutter/material.dart';
import 'package:memzstudio/status_screen.dart';

class BookingDetails extends StatelessWidget {
  static const routeName = '/booking-details';
  const BookingDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Name'),
                onPressed: () => null,
              ),
              OutlinedButton(
                child: const Text('Phone Number'),
                onPressed: () => null,
              ),
              OutlinedButton(
                child: const Text('Package Selected'),
                onPressed: () => null,
              ),
              OutlinedButton(
                child: const Text('Status'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(StatusScreen.routeName),
              ),
              ElevatedButton(
                child: const Text('Done'),
                onPressed: () => null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
