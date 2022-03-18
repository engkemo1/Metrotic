import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:metrotic/View/Profile2.dart';
import 'package:metrotic/helper.dart';
import 'package:metrotic/widget/AppBar.dart';
import 'package:metrotic/widget/Person.dart';
import 'package:metrotic/widget/botom%20Bar.dart';
import 'package:metrotic/widget/line%20Station.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PanelController _pc = new PanelController();

  @override
  void dispose() {
    _pc;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 2,
        ),
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Stack(children: <Widget>[
          Container(
            height: height / 0.5,
            decoration: BoxDecoration(
              color: const Color(0xff00334a),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: InkWell(
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
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Profile()));
                  },
                  child: Person(
                      high: 120,
                      width: 120,
                      color: Colors.white,
                      color2: ColorsHelp.background,
                      size: 120,
                      reduis: 80),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Kamal Magdy ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  'Daily ticket',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Good Morning kamal :)',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  "Where Do You Want \n To Go Today ?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            controller: _pc,
            minHeight: height * 0.4,
            maxHeight: height,
            panel: Column(children: [
              AppBarr(text: "Booking Ticket"),
              Container(
                child: Container(
                  height: 200,
                  width: 300,
                  margin: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: const Color(0xbfffffff),
                    borderRadius: BorderRadius.circular(12.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xbf00334a)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1f000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: ColorsHelp.background,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                child: Text(
                                  "From Station",
                                  style:
                                      TextStyle(color: ColorsHelp.background),
                                ),
                                onTap: () {
                                  _pc.open();
                                  showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(1, 4),
                                                      color: Colors.grey,
                                                      blurRadius: 3)
                                                ]),
                                            height: 120,
                                            width: 300,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                            color: ColorsHelp
                                                                .background,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: GestureDetector(
                                                          child: Center(
                                                            child: Text(
                                                              "First Line",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none),
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            showAnimatedDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  true,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Align(
                                                                    alignment:
                                                                        Alignment(
                                                                            0,
                                                                            0.4),
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              20),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          400,
                                                                      child: LineStation(
                                                                          Text1:
                                                                              "Helwan",
                                                                          Text2:
                                                                              "Ain Helwan",
                                                                          Text3:
                                                                              "Helwan University",
                                                                          Text4:
                                                                              "Wadi Hof",
                                                                          Text5:
                                                                              "Hadayek Helwan",
                                                                          Text6:
                                                                              "El_Maasara",
                                                                          Text7:
                                                                              "Tora El_Asmant",
                                                                          Text8:
                                                                              "Kozzika",
                                                                          Text9:
                                                                              "Tora El_Balad",
                                                                          Text10:
                                                                              "Sakanat El_maadi",
                                                                          Text11:
                                                                              "Maddi",
                                                                          Text12:
                                                                              "Hadayek El_Maadi",
                                                                          Text13:
                                                                              "Dar El_Salam"),
                                                                    ));
                                                              },
                                                              animationType:
                                                                  DialogTransitionType
                                                                      .slideFromBottomFade,
                                                              curve: Curves
                                                                  .fastOutSlowIn,
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                            color: ColorsHelp
                                                                .background,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: GestureDetector(
                                                          child: Center(
                                                              child: Text(
                                                            "Second Line",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .white,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          )),
                                                          onTap: () {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                            color: ColorsHelp
                                                                .background,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: GestureDetector(
                                                          child: Center(
                                                            child: Text(
                                                              "Third Line",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none),
                                                            ),
                                                          ),
                                                          onTap: () {},
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 120,
                                                      ),
                                                    ],
                                                  )
                                                ])),
                                      );
                                    },
                                    animationType: DialogTransitionType.size,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(seconds: 1),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.my_location,
                                    color: ColorsHelp.background,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 3,
                                    color: ColorsHelp.background,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "To Station",
                                      style: TextStyle(
                                          color: ColorsHelp.background),
                                    ),
                                    onTap: () {
                                      _pc.open();
                                      showAnimatedDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: Offset(1, 4),
                                                          color: Colors.grey,
                                                          blurRadius: 3)
                                                    ]),
                                                height: 120,
                                                width: 300,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 120,
                                                            decoration: BoxDecoration(
                                                                color: ColorsHelp
                                                                    .background,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child:
                                                                GestureDetector(
                                                              child: Center(
                                                                child: Text(
                                                                  "First Line",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none),
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                showAnimatedDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      true,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return Align(
                                                                        alignment: Alignment(
                                                                            0,
                                                                            0.4),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.only(left: 20),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          width:
                                                                              300,
                                                                          height:
                                                                              400,
                                                                          child: LineStation(
                                                                              Text1: "Helwan",
                                                                              Text2: "Ain Helwan",
                                                                              Text3: "Helwan University",
                                                                              Text4: "Wadi Hof",
                                                                              Text5: "Hadayek Helwan",
                                                                              Text6: "El_Maasara",
                                                                              Text7: "Tora El_Asmant",
                                                                              Text8: "Kozzika",
                                                                              Text9: "Tora El_Balad",
                                                                              Text10: "Sakanat El_maadi",
                                                                              Text11: "Maddi",
                                                                              Text12: "Hadayek El_Maadi",
                                                                              Text13: "Dar El_Salam"),
                                                                        ));
                                                                  },
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .slideFromBottomFade,
                                                                  curve: Curves
                                                                      .fastOutSlowIn,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 35,
                                                            width: 120,
                                                            decoration: BoxDecoration(
                                                                color: ColorsHelp
                                                                    .background,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child:
                                                                GestureDetector(
                                                              child: Center(
                                                                  child: Text(
                                                                "Second Line",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none),
                                                              )),
                                                              onTap: () {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 120,
                                                            decoration: BoxDecoration(
                                                                color: ColorsHelp
                                                                    .background,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child:
                                                                GestureDetector(
                                                              child: Center(
                                                                child: Text(
                                                                  "Third Line",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none),
                                                                ),
                                                              ),
                                                              onTap: () {},
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 35,
                                                            width: 120,
                                                          ),
                                                        ],
                                                      )
                                                    ])),
                                          );
                                        },
                                        animationType:
                                            DialogTransitionType.size,
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(seconds: 1),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                height: 180,
              ),
            ]),
            collapsed: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: ColorsHelp.background),
                    color: const Color(0xff00334a),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 10,
                      width: 80,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ])));
  }
}
