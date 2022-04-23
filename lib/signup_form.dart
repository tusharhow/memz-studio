import 'dart:convert'; //package contains encoders and decoders
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:memzstudio/login_screen.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  var data = {
    'email': '',
    'password': '',
    'full_name': '',
    'phone_number': '',
    'confirm_password': '',
    'dob': '',
    'location': '',
    'gender': '',
    'role': '',
  };

  var selectedGender = 'male';
  String selectedDOB;

  Future<void> submitForm() async {
    if (!formKey.currentState.validate()) return;
    if (selectedDOB == null) return;

    formKey.currentState.save();
    FocusScope.of(context).unfocus();
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //To create a new Firebase Auth instance
          email: data['email'],
          password: data['password']);
      data['password'] = md5.convert(utf8.encode(data['password'])).toString();
      data.remove('confirm_password');
      //to wait for firestore to retrieve all the data from the database
      await FirebaseFirestore.instance
          // Create a CollectionReference called users
          .collection('users')
          .doc(user.user.uid)
          .set(data);
      formKey.currentState.reset(); //Resets every FormField to initial value
      await user.user.sendEmailVerification();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('You have been registered successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (err) {
      //to print the error mesg if its already exist
      print(err.message);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: Text(err.message),
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
              label: Text('Full Name'),
            ),
            keyboardType: TextInputType.name,
            validator: (val) {
              if (val.isEmpty) return "Invalid name!";
              return null;
            },
            onSaved: (val) => data['full_name'] = val,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Phone Number'),
            ),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (!RegExp(r'^[79][0-9]{7}$').hasMatch(val)) {
                //it can start by 7 or 9 only
                return 'Invalid Phone Number';
              }
              return null;
            },
            onSaved: (val) => data['phone_number'] = val,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now().subtract(Duration(days: 36525)),
                  maxTime: DateTime.now().subtract(Duration(days: 6574)),
                  onChanged: (date) {
                data['dob'] = date.toIso8601String().substring(0, 10);
              }, onConfirm: (date) {
                setState(() {
                  data['dob'] = date.toIso8601String().substring(0, 10);
                  selectedDOB = date.toIso8601String().substring(0, 10);
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Text(
              selectedDOB ?? 'Select date of birth',
            ),
          ),
          const SizedBox(height: 10),
          DropdownButton(
            isExpanded: true,
            value: selectedGender,
            items: <String>['male', 'female'].map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                selectedGender = val;
                data['gender'] = val;
              });
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Location'),
            ),
            keyboardType: TextInputType.text,
            validator: (val) {
              if (val.isEmpty) return "Invalid location!";
              return null;
            },
            onSaved: (val) => data['location'] = val,
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (val) {
              if (val.length < 6) {
                //becouse firebase accept at least 6 char
                return "Please enter at least 6 characters";
              }
              return null;
            },
            onSaved: (val) => data['password'] = val,
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
              //compair password with the confirm password
              print(val);
              print(data['password']);
              if (val != data['password']) {
                return "Passwords don't match";
              }
              return null;
            },
            onSaved: (val) => data['confirm_password'] = val,
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(
                'SIGN UP',
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
              text: 'Already have an account? ',
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              children: [
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    color: theme.colorScheme.primaryVariant,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'By clicking signup you accept the Terms of\n Service and Privacy Policy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: theme.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
