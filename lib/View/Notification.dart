import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../helper.dart';
import '../widget/botom Bar.dart';
import 'menu.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 4,
        ),
        body: SafeArea(
          child: ListView(children: [
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.green,size: 30,
                          )),
                      Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelp.background),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Menu()));
                        },
                        child: Image.asset(
                          "assets/menu.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 40,

                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.green,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been booked \nsuccessfully',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.white,thickness: 2,),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.green,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been booked \nsuccessfully',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      ),
                       SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.white,thickness: 2,),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been Expired',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      )   ,SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.white,thickness: 2,),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been booked \nsuccessfully',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.white,thickness: 2,),
                      SizedBox(
                        height: 15,
                      ),                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been booked \nsuccessfully',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(color: Colors.white,thickness: 2,),
                      SizedBox(
                        height: 15,
                      ),                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your ticket has been Expired',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1.5294117647058822,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
