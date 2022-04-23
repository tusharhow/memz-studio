import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:memzstudio/home_screen.dart';
import 'package:memzstudio/payment_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookinScreen extends StatefulWidget {
  static const routeName = '/booking';
  final Map<String, dynamic> package;
  const BookinScreen(this.package, {Key key}) : super(key: key);

  @override
  State<BookinScreen> createState() => _BookinScreenState();
}

class _BookinScreenState extends State<BookinScreen> {
  DateTime date;
  List<Appointment> appointments = <Appointment>[];

  void showNotification(String datetime) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) => print(payload),
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Booking', 'You booked at $datetime', platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('bookings');
    Query<Map<String, dynamic>> query;
    query = ref.where('status', whereIn: ['requested', 'completed']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: query.get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            for (var i = 0; i < snapshot.data.docs.length; i++) {
              DateTime date =
                  (snapshot.data.docs[i]['date'] as Timestamp).toDate();
              final orderData =
                  snapshot.data.docs[i].data() as Map<String, dynamic>;
              final hours =
                  orderData['package']['hours'].toString().split(':')[0];
              final minutes =
                  orderData['package']['hours'].toString().split(':')[1];
              appointments.add(
                Appointment(
                  startTime: date,
                  endTime: date.add(Duration(
                      hours: int.parse(hours), minutes: int.parse(minutes))),
                  subject: 'Booked',
                  color: Colors.grey,
                  startTimeZone: '',
                  endTimeZone: '',
                ),
              );
            }
            final dataSource = _AppointmentDataSource(appointments);
            return Column(
              children: [
                Expanded(
                  child: SfCalendar(
                    view: CalendarView.week,
                    dataSource: dataSource,
                    onTap: (CalendarTapDetails details) {
                      dynamic appointment = details.appointments;
                      date = details.date;
                      CalendarElement element = details.targetElement;
                      // setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                    child: const Text('Proceed to Payment'),
                    onPressed: () {
                      var isDateBooked = false;
                      final isDatePassed = date.isBefore(DateTime.now());
                      appointments.forEach((appointment) {
                        if (appointment.startTime == date) {
                          isDateBooked = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Time slot is booked !'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Code to execute.
                                },
                              ),
                            ),
                          );
                        }
                      });
                      if (isDatePassed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Time slot has already passed !'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                // Code to execute.
                              },
                            ),
                          ),
                        );
                      } else if (date == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Please select time slot !'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                // Code to execute.
                              },
                            ),
                          ),
                        );
                      } else if (date != null && !isDateBooked) {
                        showNotification(date.toString().substring(0, 16));
                        Navigator.of(context).pushNamed(PaymentScreen.routeName,
                            arguments: {
                              'package': widget.package,
                              'date': date
                            });
                      }
                    })
              ],
            );
            ;
          }),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
