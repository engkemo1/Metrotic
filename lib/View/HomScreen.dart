
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrotic/View/Profile2.dart';
import 'package:metrotic/helper.dart';
import 'package:metrotic/widget/Person.dart';
import 'package:metrotic/widget/new%20screen.dart';

import 'menu.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: width > 600
            ? HomeNew()
            : SafeArea(
                child: Column(children: <Widget>[
               Container(
                   height: height*0.5+100,
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
                              padding: EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Menu()));
                                },
                                child: Image.asset(
                                  "assets/menu.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Profile()));
                          },
                          child: Person(
                              high: 150,
                              width: 150,
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
                            fontSize: 30,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            height: 1.608695652173913,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        Text(
                          'Daily ticket',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 19,
                            color: Colors.green,
                            height: 1.608695652173913,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Good Morning kamal :)',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.green,
                            height: 1.608695652173913,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        Text(
                          "Where Do You Want \n To Go Today ?",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 23,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            height: 1.608695652173913,
                          ),
                          textAlign: TextAlign.center,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/logo.png",
                            height: 70,
                            width: 70,
                          ),
                        )
                      ],
                    ),
                  ),


Center(
  child: Container(
    height: 100,width: 250,
    decoration: BoxDecoration(
        color: Colors.white
        ,
        borderRadius: BorderRadius.circular(25),
    boxShadow: [BoxShadow(
      color: Colors.grey
          ,offset: Offset(1,7),blurRadius: 8
    )]  git commit -m "first commit"
    ),

    child:Column(
      children: [],
    ) ,
  ),
)


              ])));
  }
}
//jjkkjghjgdf