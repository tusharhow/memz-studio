import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/contact_us_screen.dart';
import 'package:memzstudio/help_screen.dart';
import 'package:memzstudio/home_screen.dart';
import 'package:memzstudio/login_screen.dart';
import 'package:memzstudio/orders_screen.dart';
import 'package:memzstudio/packages_screen.dart';
import 'package:memzstudio/profile_screen.dart';
import 'package:memzstudio/report_screen.dart';

import 'customer_packages_screen.dart';

class CustomerDrawerScreen extends StatelessWidget {
  const CustomerDrawerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            DrawerHeader(
                child: Text(
              'memzstudio',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue[300],
                fontWeight: FontWeight.bold,
              ),
            )),
            ListTile(
              title: const Text('Home'),
              trailing: const Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(HomeScreen.routeName),
            ),
            ListTile(
              title: const Text('My Profile'),
              trailing: const Icon(
                Icons.account_circle,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(ProfileScreen.routeName),
            ),
            ListTile(
              title: const Text('Packages'),
              trailing: const Icon(
                Icons.add_box_rounded,
                color: Colors.blueGrey,
              ),
              onTap: () => Navigator.of(context)
                  .pushNamed(CustomerPackagesScreen.routeName),
            ),
            ListTile(
              title: const Text('Orders'),
              trailing: const Icon(
                Icons.request_page_rounded,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(OrderScreen.routeName),
            ),
            ListTile(
              title: const Text('Contact us'),
              trailing: const Icon(
                Icons.connect_without_contact_sharp,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(ContactUsScreen.routeName),
            ),
            ListTile(
                title: const Text('Logout'),
                trailing: const Icon(
                  Icons.logout_rounded,
                  color: Colors.blueGrey,
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
