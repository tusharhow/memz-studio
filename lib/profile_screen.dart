import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:memzstudio/reset_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final data = {
    'full_name': '',
    'phone_number': '',
    'dob': '',
    'location': '',
    'gender': '',
  };

  String selectedGender = 'male';

  final _userId = FirebaseAuth.instance.currentUser.uid;
  final _formKey = GlobalKey<FormState>();

  Future<void> _updateProfile() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userId)
          .update(data);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('You\'r profile has been updated successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      setState(() {});
    } catch (err) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              FirebaseFirestore.instance.collection('users').doc(_userId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final userDoc = snapshot.data.data() as Map<String, dynamic>;
            selectedGender =
                userDoc['gender'] != '' ? userDoc['gender'] : 'male';
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Full Name'),
                        ),
                        keyboardType: TextInputType.name,
                        initialValue: userDoc['full_name'] ?? '',
                        validator: (val) {
                          if (val.isEmpty) return "Invalid name!";
                          return null;
                        },
                        onSaved: (val) => data['full_name'] = val,
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
                      TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now()
                                  .subtract(Duration(days: 36525)),
                              maxTime:
                                  DateTime.now().subtract(Duration(days: 6574)),
                              onChanged: (date) {
                            data['dob'] =
                                date.toIso8601String().substring(0, 10);
                          }, onConfirm: (date) {
                            setState(() {
                              data['dob'] =
                                  date.toIso8601String().substring(0, 10);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          data['dob'] == ''
                              ? 'Select date of birth'
                              : data['dob'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('location'),
                        ),
                        keyboardType: TextInputType.text,
                        initialValue: userDoc['location'] ?? '',
                        validator: (val) {
                          if (val.isEmpty) return "Invalid location!";
                          return null;
                        },
                        onSaved: (val) => data['location'] = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Phone Number'),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: userDoc['phone_number'] ?? '',
                        validator: (String val) {
                          if (!RegExp(r'^[79][0-9]{7}$').hasMatch(val)) {
                            //it can start by 7 or 9 only
                            return 'Invalid Phone Number';
                          }
                          return null;
                        },
                        onSaved: (val) => data['phone_number'] = val,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        child: const Text('Save Profile'),
                        onPressed: _updateProfile,
                      ),
                      ElevatedButton(
                        child: const Text('Reset Password'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(ResetPassword.routeName),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
