import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/current_orders.dart';
import 'package:memzstudio/history_orders.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({Key key}) : super(key: key);

  void generateOrdersReport() async {
    final userId = FirebaseAuth.instance.currentUser.uid;
    final bookingsRef = await FirebaseFirestore.instance
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();
    final bookingsDocs = bookingsRef.docs;

    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    grid.columns.add(count: 5);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Booking ID';
    header.cells[1].value = 'Package title';
    header.cells[2].value = 'User Email';
    header.cells[3].value = 'Date';
    header.cells[4].value = 'Status';

    PdfGridRow row = grid.rows.add();
    bookingsDocs.forEach((bookingDoc) {
      final bookingDate = bookingDoc.data() as Map<String, dynamic>;
      row = grid.rows.add();
      row.cells[0].value = bookingDoc.id;
      row.cells[1].value = bookingDate['package']['title'];
      row.cells[2].value = bookingDate['user']['email'];
      row.cells[3].value =
          (bookingDate['date'] as Timestamp).toDate().toString();
      row.cells[4].value = bookingDate['status'];
    });

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final fileName = 'Output' + DateTime.now().toString() + '.pdf';
    File file = File('$path/$fileName');
    file.writeAsBytes(document.save());
    OpenFile.open('$path/$fileName');

    document.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Current bookings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'History',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrentOrders(),
            HistoryOrders(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Generate Report'),
          onPressed: generateOrdersReport,
        ),
      ),
    );
  }
}
