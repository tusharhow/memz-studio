import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/add_package_screen.dart';
import 'package:memzstudio/package_details_screen.dart';

class PackagesScreen extends StatefulWidget {
  static const routeName = '/packages';

  const PackagesScreen({Key key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  var searchText = '';

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('packages');
    Query<Map<String, dynamic>> query;
    query = ref.orderBy('title').startAt([
      searchText,
    ]).endAt([searchText + '\uf8ff']);
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
              final packages = snapshot.data.docs;
              return ListView.builder(
                itemCount: packages.length,
                itemBuilder: (ctx, index) {
                  final package =
                      packages[index].data() as Map<String, dynamic>;
                  final packageId = packages[index].id;
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(package['title']),
                        title: Text(" ${package['price']} OMR"),
                        subtitle: Text(" ${package['hours']} hours"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[300],
                          ),
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('packages')
                                .doc(packageId)
                                .delete();
                          },
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PackageDetailsScreen(package, packageId),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: () =>
            Navigator.of(context).pushNamed(AddPackageScreen.routeName),
      ),
    );
  }
}
