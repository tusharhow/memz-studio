import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatelessWidget {
  static const routeName = '/report-details';
  const ReportDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        centerTitle: true,
      ),
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
          SizedBox(
            height: 50,
          ),
          const Center(
            child: Text('Report Details'),
          ),
        ],
      ),
    );
  }
}
