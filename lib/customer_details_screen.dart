import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> user;
  final String userId;
  const CustomerDetailsScreen(this.user, this.userId, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(
            './assets/images/user.png',
            height: 200,
          ),
          Text(
            user['full_name'],
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.blueGrey,
                ),
                title: const Text('Email'),
                trailing: Text(user['email']),
              ),
              ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.blueGrey,
                ),
                title: const Text('Phone Number'),
                trailing: Text(user['phone_number']),
              ),
              ListTile(
                leading: const Icon(
                  Icons.male,
                  color: Colors.blueGrey,
                ),
                title: const Text('Gender'),
                trailing: Text(user['gender']),
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_pin,
                  color: Colors.blueGrey,
                ),
                title: const Text('Location'),
                trailing: Text(user['location']),
              ),
              ListTile(
                leading: const Icon(
                  Icons.date_range,
                  color: Colors.blueGrey,
                ),
                title: const Text('Date of birth'),
                trailing: Text(user['dob']),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red[300],
              minimumSize: Size(300, 40),
            ),
            child: const Text('Delete'),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .delete();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
