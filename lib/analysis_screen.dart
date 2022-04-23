import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalysisScreen extends StatelessWidget {
  static const routeName = '/analysis';
  const AnalysisScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Analysis'),
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
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 120,
            right: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  UsersCount(),
                  PackagesCount(),
                ],
              ),
              const SizedBox(height: 20),
              const BookingsCount(),
              const SizedBox(height: 20),
              PieChart()
            ],
          ),
        ),
      ],
    ));
  }
}

class PieChart extends StatelessWidget {
  const PieChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').get(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final userDocs = snapshot.data.docs;
          var maleCount = 0;
          var femaleCount = 0;
          userDocs.forEach((doc) {
            final userData = doc.data() as Map<String, dynamic>;
            if (userData['gender'] == 'male')
              maleCount++;
            else
              femaleCount++;
          });
          final List<ChartData> chartData = [
            ChartData('Male', maleCount.toDouble()),
            ChartData('Female', femaleCount.toDouble()),
          ];
          return Container(
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
              legend: Legend(isVisible: true),
            ),
          );
        });
  }
}

class UsersCount extends StatelessWidget {
  const UsersCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').get(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        final users = snapshot.data.docs;
        return Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400], width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                users.length.toString(),
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const Text(
                'Users Count',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PackagesCount extends StatelessWidget {
  const PackagesCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('packages').get(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        final users = snapshot.data.docs;
        return Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400], width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                users.length.toString(),
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const Text(
                'Packages Count',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BookingsCount extends StatelessWidget {
  const BookingsCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('bookings').get(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        final users = snapshot.data.docs;
        return Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400], width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                users.length.toString(),
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const Text(
                'Bookings Count',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
