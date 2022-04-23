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

import 'admin_home_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key}) : super(key: key);

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
              ),
            ),
            ListTile(
              title: const Text('Home'),
              trailing: const Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(AdminHomeScreen.routeName),
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
                Icons.add_box,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(PackagesScreen.routeName),
            ),
            ListTile(
              title: const Text('Report'),
              trailing: const Icon(
                Icons.document_scanner,
                color: Colors.blueGrey,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(ReportScreen.routeName),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
