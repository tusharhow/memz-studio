import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/status_screen.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CurrentOrders extends StatelessWidget {
  static const routeName = '/current-order';
  const CurrentOrders({Key key}) : super(key: key);

  void generateOrderReport(String orderId) async {
    final bookingsRef = await FirebaseFirestore.instance
        .collection('bookings')
        .doc(orderId)
        .get();

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
    final bookingDate = bookingsRef.data() as Map<String, dynamic>;
    row = grid.rows.add();
    row.cells[0].value = orderId;
    row.cells[1].value = bookingDate['package']['title'];
    row.cells[2].value = bookingDate['user']['email'];
    row.cells[3].value = (bookingDate['date'] as Timestamp).toDate().toString();
    row.cells[4].value = bookingDate['status'];

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
    final userId = FirebaseAuth.instance.currentUser.uid;
    final ref = FirebaseFirestore.instance.collection('bookings');
    Query<Map<String, dynamic>> query;
    query = ref.where('userId', isEqualTo: userId);
    return StreamBuilder(
      stream: query.snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final orders = snapshot.data.docs;
        if (orders.isEmpty) {
          return const Center(
            child: Text('No Data to be displayed'),
          );
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (_, i) {
            final order = orders[i].data() as Map<String, dynamic>;
            final orderId = orders[i].id;
            if (order['status'] != 'requested') {
              return const SizedBox();
            }
            return ListTile(
              isThreeLine: true,
              title: Text(order['package']['title']),
              subtitle: Text((order['date'] as Timestamp)
                  .toDate()
                  .toString()
                  .substring(0, 16)),
              leading: Text(
                order['status'],
                style: TextStyle(
                    color: order['status'] == 'requested'
                        ? Colors.green
                        : Colors.red,
                    height: 2),
              ),
              trailing: ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('bookings')
                      .doc(orderId)
                      .update({'status': 'cancelled'});
                },
              ),
              onTap: () => generateOrderReport(orderId),
            );
          },
        );
      },
    );
  }
}
