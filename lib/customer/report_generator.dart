import 'package:flutter/material.dart';
import 'package:memzstudio/components/primary_button.dart';

import '../components/mini_button.dart';

class ReportGenerator extends StatelessWidget {
  const ReportGenerator({Key key}) : super(key: key);

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
                    left: 100,
                  ),
                  child: Image.asset(
                    "assets/images/repo.png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Report Generator',
                        style: theme.textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                    child: ReusablePrimaryButton(
                        childText: 'generate report of payment receipt',
                        onPressed: () {})),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ReusablePrimaryButton(
                        childText: 'generate report of  all orders',
                        onPressed: () {})),

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
