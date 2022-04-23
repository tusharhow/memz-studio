import 'package:flutter/material.dart';

import '../components/mini_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final theme = Theme.of(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      drawer: Drawer(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/dr.png",
            // height: 100,
            // width: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Packages",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Services",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Book here !",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Booking derails",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "State",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Report Generator",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: BoxDecoration(
              color: Color(0xffC4C4C4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Contact Us !",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
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
            child: GestureDetector(
              onTap: () {
                scaffoldKey.currentState.openDrawer();
              },
              child: Image.asset(
                "assets/images/menu.png",
                height: 40,
                width: 40,
              ),
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
                    "assets/images/h.png",
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
                        'Onlie Gallary',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xC4C4C4).withOpacity(0.50),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/pho.png",
                          // height: 100,
                          // width: 100,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xC4C4C4).withOpacity(0.50),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/vid.png",
                          // height: 100,
                          // width: 100,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 100,
                ),

                Center(
                    child: MiniButton(
                        childText: 'Back !',
                        onPressed: () {
                          scaffoldKey.currentState.openDrawer();
                        })),
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
