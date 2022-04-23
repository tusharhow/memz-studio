import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class PhotographyCustomer extends StatelessWidget {
  const PhotographyCustomer({Key key}) : super(key: key);

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
                    top: 100,
                    right: 30,
                    left: 60,
                  ),
                  child: Image.asset(
                    "assets/images/pho2.png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 150,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Photography',
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
                    'we can snapshot your unforgettable memories and we will focus on your own photography of events and activities relating to weddings.',
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
