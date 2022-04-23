import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/update_package_screen.dart';

class CustomerPackageDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> package;
  final String packageId;
  const CustomerPackageDetailsScreen(this.package, this.packageId, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(package);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Details'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Title'),
                    Text(package['title']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Price'),
                    Text(package['price']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Hours'),
                    Text(package['hours']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Description'),
                    Text(package['description']),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blueGrey[600]),
            child: const Text('Book'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BookinScreen(package),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
