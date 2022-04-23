import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/status_screen.dart';

class HistoryOrders extends StatelessWidget {
  static const routeName = '/current-order';
  const HistoryOrders({Key key}) : super(key: key);

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
            if (order['status'] == 'requested') {
              return const SizedBox();
            }
            return ListTile(
              isThreeLine: true,
              title: Text(order['package']['title']),
              subtitle: Text((order['date'] as Timestamp)
                  .toDate()
                  .toString()
                  .substring(0, 16)),
              trailing: Text(
                order['status'],
                style: TextStyle(
                    color: order['status'] == 'requested'
                        ? Colors.green
                        : Colors.red,
                    height: 2),
              ),
            );
          },
        );
      },
    );
  }
}
