import 'package:flutter/material.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/customer_drawer.dart';
import 'package:memzstudio/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const CustomerDrawerScreen(),
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
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 30,
              left: 70,
            ),
            child: Image.asset(
              "assets/images/serc.png",
              // height: 250,
              // width: 250,
            ),
          ),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       OutlinedButton(
          //         child: const Text('Photography'),
          //         onPressed: () =>
          //             Navigator.of(context).pushNamed(BookinScreen.routeName),
          //       ),
          //       OutlinedButton(
          //         child: const Text('Videography'),
          //         onPressed: () =>
          //             Navigator.of(context).pushNamed(BookinScreen.routeName),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(BookinScreen.routeName),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/vid.png",
                        // height: 250,
                        // width: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 60,
                        ),
                        child: Text(
                          'Photography',
                          style: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(BookinScreen.routeName),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/pho.png",
                        // height: 250,
                        // width: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 0,
                        ),
                        child: Text(
                          'Videography',
                          style: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
