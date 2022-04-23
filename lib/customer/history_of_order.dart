import 'package:flutter/material.dart';

import '../components/mini_button.dart';
import '../components/primary_button.dart';

class HistoryOfOrder extends StatelessWidget {
  const HistoryOfOrder({Key key}) : super(key: key);

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
                    left: 80,
                  ),
                  child: Image.asset(
                    "assets/images/his.png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 120,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'History of Order ',
                        style: theme.textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Order 1:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Date:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Package selected:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'State:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Order 2:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Date:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Package selected:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'State:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 80,
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
