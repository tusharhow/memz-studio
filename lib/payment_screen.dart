import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:memzstudio/booking_details.dart';
import 'package:memzstudio/orders_screen.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    // final package = args['package'];
    // final date = args['date'];

    final _formData = {
      'card_number': '',
      'valid_until': '',
      'cvv': '',
      'card_holder': '',
    };
    final _formKey = GlobalKey<FormState>();

    void _submitForm() async {
      if (!_formKey.currentState.validate()) return;

      _formKey.currentState.save();
      final _userId = FirebaseAuth.instance.currentUser.uid;
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(_userId)
          .get();
      final userData = user.data();

      try {
        await FirebaseFirestore.instance.collection('bookings').add({
          'userId': _userId,
          'user': userData,
          // 'date': date,
          // 'package': package,
          'status': 'requested',
        });
      } catch (err) {
        print('err: $err');
      }

      _formKey.currentState.reset();

      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Your booking is confirmed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(OrderScreen.routeName),
              child: const Text('OK'),
            ),
          ],
        ),
      );

      // final Email email = Email(
      //   body: 'Email body',
      //   subject: 'Payment Receipt',
      //   recipients: [user['email']],
      //   // cc: ['cc@example.com'],
      //   // bcc: ['bcc@example.com'],
      //   // attachmentPaths: ['/path/to/attachment.zip'],
      //   isHTML: false,
      // );

      // await FlutterEmailSender.send(email);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
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
          // SizedBox(
          //   height: 50,
          // ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 30,
              left: 90,
            ),
            child: Image.asset(
              "assets/images/pay.png",
              // height: 200,
              // width: 200,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Payment Details',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Card Number'),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '####-####-####-####',
                          ),
                        ],
                        validator: (String val) {
                          if (val.length != 19)
                            return 'Please enter valid card number';
                          if (val == '0000-0000-0000-0000')
                            return 'Please enter valid card number';
                          return null;
                        },
                        onSaved: (val) => _formData['card_number'] = val,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Valid Until'),
                                hintText: 'mm/yy',
                              ),
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '##/##',
                                ),
                              ],
                              validator: (String val) {
                                if (val.isEmpty) return 'Invalid date';
                                final month = int.tryParse(val.split('/')[0]);
                                final year =
                                    int.tryParse(val.split('/')[1]) + 2000;
                                final currentYear = DateTime.now().year;
                                final currentMonth = DateTime.now().month;
                                if (month < 1 || month > 12)
                                  return 'Invalid month';
                                if (year == currentYear &&
                                    month < currentMonth) {
                                  return 'Invalid date';
                                }
                                if (year < currentYear ||
                                    year > (currentYear + 10)) {
                                  return 'Invalid year';
                                }
                                return null;
                              },
                              onSaved: (val) => _formData['valid_until'] = val,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text('CVV'),
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '###',
                                ),
                              ],
                              validator: (String val) {
                                if (val.length != 3) return 'Invalid CVV';
                                if (val == '000') return 'Invalid CVV';
                                return null;
                              },
                              onSaved: (val) => _formData['cvv'] = val,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Card Holder'),
                        ),
                        validator: (String val) {
                          if (val.trim().length < 3)
                            return 'Please enter valid name';
                          return null;
                        },
                        onSaved: (String val) =>
                            _formData['card_holder'] = val.trim(),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Pay Now'),
                          onPressed: _submitForm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
