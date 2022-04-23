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
      body: const Center(
        child: Text('Report Details'),
      ),
    );
  }
}
