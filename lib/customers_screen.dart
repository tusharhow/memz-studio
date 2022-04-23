import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/customer_details_screen.dart';

class CustomersScreen extends StatefulWidget {
  static const routeName = '/customers';

  const CustomersScreen({Key key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  var searchText = '';
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('users');
    Query<Map<String, dynamic>> query;
    query = ref.orderBy('email').startAt(
      [searchText],
    ).endAt([searchText + '\uf8ff']);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
            decoration: const InputDecoration(
              hintText: 'Search...',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (String value) {
              setState(() {
                searchText = value;
              });
            }),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: query.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.docs.isEmpty) {
            return const Center(
              child: Text('No data to be displayed.'),
            );
          }
          final users = snapshot.data.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, index) {
              final user = users[index].data() as Map<String, dynamic>;
              final userId = users[index].id;
              return Column(
                children: [
                  ListTile(
                    title: Text(user['email']),
                    subtitle: Text(user['phone_number']),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[300],
                      ),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userId)
                            .delete();
                      },
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomerDetailsScreen(user, userId),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
