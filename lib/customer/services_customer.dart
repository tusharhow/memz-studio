import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class ServicesCustomer extends StatelessWidget {
  const ServicesCustomer({Key key}) : super(key: key);

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
                        'Services',
                        style: theme.textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
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

                SizedBox(
                  height: 40,
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
