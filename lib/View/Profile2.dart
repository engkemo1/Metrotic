import 'package:flutter/material.dart';

import '../widget/AppBar.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';

class Profile extends StatefulWidget {
  
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double loginWidth = 40.0;
@override
  void initState() {
    // TODO: implement initState
loginWidth=300;  }
  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BotoomBar(index: 3,),
      body: SafeArea(
          child: ListView(
            children: [
              AppBarr(
                text: "Profile",
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      Person(
                        high: 150,
                        width: 150,
                        color: const Color(0xff00334a),
                        color2: Colors.white,
                        size: 140,
                        reduis: 100,
                      ),


                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AnimatedContainer(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  height: loginWidth,
                  width: w,

                  decoration: BoxDecoration(
                    color: const Color(0xff00334a),
                    borderRadius: BorderRadius.circular(20),
                  ),
duration: Duration(seconds: 5),
                  curve: Curves.bounceInOut,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Image.asset(
                              "assets/edit.png",
                              height: 30,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.drive_file_rename_outline,
                              color: const Color(0xff00334a),
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "kamal Magdy kamal",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.phone_android_sharp,
                              color: const Color(0xff00334a),
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "+20 01032134411",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.email,
                              color: const Color(0xff00334a),
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "kemo@gmail.com",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.perm_identity,
                              color: const Color(0xff00334a),
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "1323323131223111",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                        height: 100,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xff00334a),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(
                                  "assets/ticket.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Last Ticket",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                        height: 100,
                        width: w,
                        decoration: BoxDecoration(
                          color: const Color(0xff00334a),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(
                                  "assets/ship.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "1323323111",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ))
            ],
          )),
    );
  }
}