import 'package:flutter/material.dart';
import 'package:memzstudio/analysis_screen.dart';
import 'package:memzstudio/appointments_screen.dart';
import 'package:memzstudio/customers_screen.dart';
import 'package:memzstudio/drawer.dart';
import 'package:memzstudio/packages_screen.dart';
import 'package:memzstudio/report_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  static const routeName = '/admin-home';
  const AdminHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
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
              top: 100,
              right: 10,
              left: 10,
            ),
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: [
                  OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/images/customers.png',
                      fit: BoxFit.cover,
                    ),
                    label: const Text('Customers'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(CustomersScreen.routeName),
                  ),
                  OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/images/packages.png',
                      fit: BoxFit.cover,
                    ),
                    label: const Text('Packages'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(PackagesScreen.routeName),
                  ),
                  OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/images/report.png',
                      fit: BoxFit.cover,
                    ),
                    label: const Text('Report'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ReportScreen.routeName),
                  ),
                  OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/images/analysis.png',
                      fit: BoxFit.cover,
                    ),
                    label: const Text('Data Analysis'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AnalysisScreen.routeName),
                  ),
                  OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/images/appointment.png',
                      fit: BoxFit.cover,
                    ),
                    label: const Text('Appointments'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AppointmentScreen.routeName),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
