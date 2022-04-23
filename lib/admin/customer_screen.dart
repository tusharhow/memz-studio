import 'package:flutter/material.dart';

import '../components/mini_button.dart';
import '../components/primary_button.dart';

class CustomerScreenSecond extends StatelessWidget {
  const CustomerScreenSecond({Key key}) : super(key: key);

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
                    left: 140,
                  ),
                  child: Image.asset(
                    "assets/images/cus.png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 130,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Customer',
                        style: theme.textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'List of registered Customer',
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'Search for a Customer', onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'Select a specific Customer',
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'Delete a Customer', onPressed: () {}),
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
