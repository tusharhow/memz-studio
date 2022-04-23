import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String bookingId;
  const AppointmentDetailsScreen(this.bookingId, {Key key}) : super(key: key);

  void generateAppointmentReport(Map<String, dynamic> appointment) async {
    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    grid.columns.add(count: 5);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Package title';
    header.cells[1].value = 'Customer name';
    header.cells[2].value = 'Customer phone number';
    header.cells[3].value = 'Price';
    header.cells[4].value = 'Date';

    PdfGridRow row = grid.rows.add();
    row = grid.rows.add();
    row.cells[0].value = appointment['package']['title'];
    row.cells[1].value = appointment['user']['full_name'];
    row.cells[2].value = appointment['user']['phone_number'];
    row.cells[3].value = appointment['package']['price'];
    row.cells[4].value = (appointment['date'] as Timestamp).toDate().toString();

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
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('bookings')
          .doc(bookingId)
          .get(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final appointment = snapshot.data.data() as Map<String, dynamic>;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Appointment\'s details'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Packge title'),
                    Text(appointment['package']['title']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Appointment Date'),
                    Text((appointment['date'] as Timestamp)
                        .toDate()
                        .toString()
                        .substring(0, 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Customer Name'),
                    Text(appointment['user']['full_name']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Customer Phone Number'),
                    Text(appointment['user']['phone_number']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Price'),
                    Text('${appointment['package']['price']} OMR'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text('Completed'),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('bookings')
                            .doc(bookingId)
                            .update({
                          'status': 'completed',
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      child: const Text('Print'),
                      onPressed: () => generateAppointmentReport(appointment),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[300]),
                      child: const Text('Reject'),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('bookings')
                            .doc(bookingId)
                            .update({
                          'status': 'rejected',
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
