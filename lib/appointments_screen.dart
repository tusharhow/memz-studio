import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/appointment_details_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentScreen extends StatelessWidget {
  static const routeName = '/appointment';
  const AppointmentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
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
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('bookings').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final appointments = snapshot.data.docs;
              return ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (_, index) {
                  final id = appointments[index].id;
                  final appointment =
                      appointments[index].data() as Map<String, dynamic>;
                  DateTime date = (appointment['date'] as Timestamp).toDate();
                  if (appointment['status'] != 'requested') {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      // right: 10,
                      // left: 10,
                    ),
                    child: ListTile(
                      title: Text(appointment['package']['title']),
                      subtitle: Text(date.toString().substring(0, 16)),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => AppointmentDetailsScreen(id),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
