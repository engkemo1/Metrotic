import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../helper.dart';
class Expandables extends StatelessWidget {
final String price;
final String Destination;
final String TripPrice;
final String DiscountPercentage;

  const Expandables({Key? key,  required this.price, required this.Destination, required this.TripPrice,  required this.DiscountPercentage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return       Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            iconColor: Colors.green,
            collapseIcon: Icons.keyboard_arrow_down,
            expandIcon: Icons.keyboard_arrow_down,
            useInkWell: true,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconSize: 50),
        header: Container(
          height: 80,
          decoration: BoxDecoration(
              color: ColorsHelp.background,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 3),
                    blurRadius: 3,
                    color: Colors.grey)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                      "assets/myloc.png",
                    height: 60,
                    width: 60,
                    filterQuality: FilterQuality.high,
                  ),
                  Text(
                    Destination,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  price+"LE",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ),
        collapsed: Container(
          height: 0,
        ),
        expanded: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Table(
                      border: TableBorder.all(
                          borderRadius: BorderRadius.circular(30)),
                      // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
                                'Destination',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
                                Destination,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
                                price,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
                                'Trip Price',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: Text(
TripPrice,                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 80,
                              child: Text(
                                'Discount\nPercentage',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorsHelp.background),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: Text(
                                  DiscountPercentage+"%",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsHelp.background),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ])),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/done.png"),
                        );
                      },
                      animationType: DialogTransitionType.scale,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorsHelp.background),
                    child: Center(
                      child: Text(
                        "Book now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
