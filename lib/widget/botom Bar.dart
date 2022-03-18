import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:metrotic/View/Current%20balance.dart';
import 'package:metrotic/View/HomScreen.dart';
import 'package:metrotic/View/Notification.dart';
import 'package:metrotic/View/Setting.dart';
import '../View/Profile2.dart';
import '../helper.dart';

class BotoomBar extends StatelessWidget {
  final int index;

  const BotoomBar({required this.index});

  @override
  Widget build(BuildContext context) {
    return JumpingTabBar(
      duration:Duration(seconds: 3) ,
      backgroundColor: Colors.white,
      circleGradient: LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      items: [
        TabItemIcon(
          buildWidget: (_, color) => GestureDetector(
            child: Container(
              height: 50,width: 50,
              child: Icon(
                Icons.attach_money,
                color: ColorsHelp.background,
                size: 35,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CurrentBalance()));
            },
          ),
          endColor: Colors.green,
          startColor: Colors.red,
          curveColor: ColorsHelp.background,
        ),
        TabItemIcon(
            buildWidget: (_, color) => GestureDetector(

                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  },
                  child: Container(
                    height: 50,width: 50,

                    child: Image.asset("assets/location.png"),
                  ),
                ),
            curveColor: ColorsHelp.background),
        TabItemIcon(
          curveColor: ColorsHelp.background,
          startColor: ColorsHelp.background,
          buildWidget: (_, color) => IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Profile()));
            },
            icon: Icon(
              Icons.person,
              size: 35,
              color: ColorsHelp.background,
            ),
          ),
        ),
        TabItemIcon(
            buildWidget: (_, color) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Notif()));
                  },
                  child: Container(
                 child: Stack(
                    children: <Widget>[
                      new Icon(
                        Icons.notifications,
                        size: 35,
                        color: ColorsHelp.background,
                      ),
                      new Positioned(
                        top: 1.0,
                        right: 0.0,
                        child: new Stack(
                          children: <Widget>[
                            new Icon(
                              Icons.brightness_1,
                              size: 18.0,
                              color: Colors.green,
                            ),
                            new Positioned(
                              top: 0.0,
                              right: 4.0,
                              child: new Text("2",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  )
                )),
        TabItemIcon(
            buildWidget: (_, color) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Setting()));
                  },
                  child: Container(
                      height: 50,width: 50,
                      child: Icon(
                    Icons.settings,
                    color: ColorsHelp.background,
                    size: 35,
                  ))
                )),
      ],
      selectedIndex: index,
    );
  }
}
