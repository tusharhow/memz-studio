import 'package:firebase_auth/firebase_auth.dart'; //to access firebase authintecation
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = '/reset-password';
  const ResetPassword({Key key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  var data = {
    'old_password': '',
    'password': '',
    'confirm_password': '',
  };

  void resetPassword() async {
    if (!formKey.currentState.validate())
      return; //To make apps secure and easy to use,
    // check whether the information the user has .
    formKey.currentState.save();
    FocusScope.of(context).unfocus();
    formKey.currentState.reset();
    //create a new Firebase Auth instance
    try {
      final user = FirebaseAuth.instance.currentUser;
      //returns the email address of the current user.
      final userEmail = user.email;
      //To sign-in to an existing account
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          //get the user email and password
          email: userEmail,
          password: data["old_password"]);
      try {
        await FirebaseAuth.instance.currentUser
            .updatePassword(data['password']);
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Success'),
            content:
                const Text('You\'re password has been changed successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } catch (err) {
        print(err);
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text("err"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (err) {
      //here it will catch the error if the old password wrong
      print(err.message);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text("Old password is wrong"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
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
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 30,
          //     right: 30,
          //     left: 20,
          //   ),
          //   child: Image.asset(
          //     "assets/images/menu.png",
          //     height: 40,
          //     width: 40,
          //   ),
          // ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('old Password'),
                      ),
                      //Optimize for passwords that are visible to the user.
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val.length < 6) {
                          //validation for old password
                          return "Please enter at least 6 characters";
                        }
                        return null;
                      },
                      onSaved: (val) => data['old_password'] = val,
                      //method to call with the final value when the form is saved
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('New Password'),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val.length < 6) {
                          //validation for new password
                          return "Please enter at least 6 characters";
                        }
                        return null;
                      },
                      onSaved: (val) => data['password'] = val,
                      //use when user change the value
                      onChanged: (val) => data['password'] = val,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Confirm Password'),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (val) {
                        if (val != data['password']) {
                          return "Please enter at least 6 characters";
                        }
                        return null;
                      },
                      onSaved: (val) => data['confirm_password'] = val,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      child: const Text('Reset'),
                      onPressed: resetPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
