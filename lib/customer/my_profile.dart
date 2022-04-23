import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class CustomerMyProfile extends StatelessWidget {
  const CustomerMyProfile({Key key}) : super(key: key);

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
                    "assets/images/user1..png",
                    // height: 250,
                    // width: 250,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 140,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'My Profile',
                        style: theme.textTheme.headline5.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
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
                          'Name : .....',
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
                          'Email : .....',
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
                          'Phone Number : ....',
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
                          'Selected Package : ....',
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
                  height: 100,
                ),
                Center(
                    child: MiniButton(
                        childText: 'Update profile', onPressed: () {})),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: MiniButton(
                        childText: 'Reset Password', onPressed: () {})),
                SizedBox(
                  height: 20,
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
