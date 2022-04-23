import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class VideographyCustomer extends StatelessWidget {
  const VideographyCustomer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [],
      )),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 30,
              left: 20,
            ),
            child: Image.asset(
              "assets/images/menu.png",
              height: 40,
              width: 40,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                    right: 30,
                    left: 70,
                  ),
                  child: Image.asset(
                    "assets/images/vid.png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 140,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Videography',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          // fontWeight: FontWeight.,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Videography involves filming and editing videos for events and projects to make them unforgettable.',
                    style: TextStyle(
                      color: Color(0xff9894C1),
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Center(
                    child: MiniButton(childText: 'Back !', onPressed: () {})),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
