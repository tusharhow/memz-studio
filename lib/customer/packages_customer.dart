import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class PackagesCustomer extends StatelessWidget {
  const PackagesCustomer({Key key}) : super(key: key);

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
                    top: 80,
                    right: 30,
                    left: 70,
                  ),
                  child: Image.asset(
                    "assets/images/pkg.png",
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
                        'Packages',
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/pack.png",
                      ),
                      Column(
                        children: [
                          Text(
                            'Royal Package',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '950 OMR',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/pack.png",
                      ),
                      Column(
                        children: [
                          Text(
                            'Luxery Package',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '700 OMR',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/pack.png",
                      ),
                      Column(
                        children: [
                          Text(
                            'Royal Package',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '600 OMR',
                            style: theme.textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
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
