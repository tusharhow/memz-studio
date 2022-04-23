import 'package:flutter/material.dart';
import 'package:memzstudio/components/mini_button.dart';
import 'package:memzstudio/components/primary_button.dart';

class AppoinmentScreen extends StatelessWidget {
  const AppoinmentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                    left: 150,
                  ),
                  child: Image.asset(
                    "assets/images/app.png",
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
                        'Appoinment',
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
                      childText:
                          'Create an appointment on specific date and time',
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'List of appointments with a filter of booked',
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'Search for a specific appointment',
                      onPressed: () {}),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ReusablePrimaryButton(
                      childText: 'Delete the appointment', onPressed: () {}),
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
