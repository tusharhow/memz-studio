import 'package:flutter/material.dart';

import '../components/mini_button.dart';
import '../components/primary_button.dart';

class PaymentCustomer extends StatelessWidget {
  const PaymentCustomer({Key key}) : super(key: key);

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
                    "assets/images/pay.png",
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
                        'Payment',
                        style: theme.textTheme.headline4.copyWith(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Card Information:',
                        style: theme.textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffC4C4C4),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'card Name:',
                          style: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ))
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffC4C4C4),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'month/year:',
                          style: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ))
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffC4C4C4),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'CVV:',
                          style: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: theme.textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ))
                    ]),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                Center(child: MiniButton(childText: 'Pay', onPressed: () {})),
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
