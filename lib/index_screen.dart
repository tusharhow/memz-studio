import 'package:flutter/material.dart';

import 'signup_screen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 200,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/photography.png',
              width: double.infinity,
            ),
            const SizedBox(
              height: 150,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "We shoot every ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: theme.colorScheme.secondary,
                  fontFamily: 'Ubuntu',
                ),
                children: [
                  TextSpan(
                    text: "beautiful ",
                    style: TextStyle(color: theme.colorScheme.primaryVariant),
                  ),
                  const TextSpan(text: "memories"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                child: const Text(
                  'LET\'S START',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignupScreen.routeName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
