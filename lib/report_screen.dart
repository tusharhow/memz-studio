import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/report_details_screen.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ReportScreen extends StatelessWidget {
  static const routeName = '/report';
  const ReportScreen({Key key}) : super(key: key);

  void generateBookingsReport() async {
    final bookingsRef = await FirebaseFirestore.instance
        .collection('bookings')
        .orderBy('userId')
        .get();
    final bookingsDocs = bookingsRef.docs;

    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    grid.columns.add(count: 7);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Booking ID';
    header.cells[1].value = 'Package title';
    header.cells[2].value = 'User Email';
    header.cells[3].value = 'User Name';
    header.cells[4].value = 'Price';
    header.cells[5].value = 'Date';
    header.cells[6].value = 'Status';

    PdfGridRow row = grid.rows.add();
    bookingsDocs.forEach((bookingDoc) {
      final bookingDate = bookingDoc.data() as Map<String, dynamic>;
      row = grid.rows.add();
      row.cells[0].value = bookingDoc.id;
      row.cells[1].value = bookingDate['package']['title'];
      row.cells[2].value = bookingDate['user']['email'];
      row.cells[3].value = bookingDate['user']['full_name'];
      row.cells[4].value = bookingDate['package']['price'];
      row.cells[5].value =
          (bookingDate['date'] as Timestamp).toDate().toString();
      row.cells[6].value = bookingDate['status'];
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

  void generatePackagesReport() async {
    final packagesRef =
        await FirebaseFirestore.instance.collection('packages').get();
    final packagesDocs = packagesRef.docs;

    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    grid.columns.add(count: 3);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Package ID';
    header.cells[1].value = 'Title';
    header.cells[2].value = 'Price';

    PdfGridRow row = grid.rows.add();
    packagesDocs.forEach((packageDoc) {
      final packageDate = packageDoc.data() as Map<String, dynamic>;
      row = grid.rows.add();
      row.cells[0].value = packageDoc.id;
      row.cells[1].value = packageDate['title'];
      row.cells[2].value = packageDate['price'];
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

  void generateUsersReport() async {
    final usersRef = await FirebaseFirestore.instance.collection('users').get();
    final usersDocs = usersRef.docs;

    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    grid.columns.add(count: 3);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'user ID';
    header.cells[1].value = 'Name';
    header.cells[2].value = 'Phone Number';

    PdfGridRow row = grid.rows.add();
    usersDocs.forEach((userDoc) {
      final userDate = userDoc.data() as Map<String, dynamic>;
      row = grid.rows.add();
      row.cells[0].value = userDoc.id;
      row.cells[1].value = userDate['full_name'];
      row.cells[2].value = userDate['phone_number'];
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
          // SizedBox(
          //   height: 50,
          // ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('./assets/images/report-bg.png'),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    trailing: Icon(Icons.book),
                    title: const Text('List of bookings'),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: generateBookingsReport,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    trailing: Icon(Icons.add_box),
                    title: const Text('List of packages'),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: generatePackagesReport,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    trailing: Icon(Icons.person),
                    title: const Text('List of customers'),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: generateUsersReport,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
