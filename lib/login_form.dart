import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; //to access firebase authintecation
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:memzstudio/admin_home_screen.dart';
import 'package:memzstudio/forgot_password_screen.dart';
import 'package:memzstudio/home_screen.dart';

import 'signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  var data = {
    'email': '',
    'password': '',
  };

  Future<void> submitForm() async {
    if (!formKey.currentState.validate()) return;
    var userId;
    var userRole;
    formKey.currentState.save();
    FocusScope.of(context).unfocus();
    // if (data['email'] == 'rawahct@gmail.com') {
    //   try {
    //     await FirebaseAuth.instance.signInWithEmailAndPassword(
    //         email: data['email'], password: data['password']);
    //     Navigator.of(context).pushNamed(AdminHomeScreen.routeName);
    //   } catch (err) {
    //     showDialog(
    //       context: context,
    //       builder: (BuildContext context) => AlertDialog(
    //         title: const Text('Error'),
    //         content: const Text('Email or password is wrong.'),
    //         actions: [
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pop(),
    //             child: const Text('OK'),
    //           ),
    //         ],
    //       ),
    //     );
    //   }

    //   return;
    // }
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'].trim(), password: data['password'].trim());
      userId = user.user.uid;

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      final userData = userDoc.data() as Map<String, dynamic>;
      userRole = userData['role'];
      formKey.currentState.reset();
    } catch (err) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Email or password is wrong.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    if (userRole == 'admin')
      Navigator.of(context).pushNamed(AdminHomeScreen.routeName);
    else
      Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text('EMAIL'),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              final isEmailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(val);
              if (!isEmailValid) return "Invalid email address!";
              return null;
            },
            onSaved: (val) => data['email'] = val,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('PASSWORD'),
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (val) {
              if (val.length < 6) {
                return "Please enter at least 6 characters";
              }
              return null;
            },
            onSaved: (val) => data['password'] = val,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ForgotPasswordScreen.routeName),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
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
              onPressed: submitForm,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              children: [
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    color: theme.colorScheme.primaryVariant,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context)
                        .pushReplacementNamed(SignupScreen.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
