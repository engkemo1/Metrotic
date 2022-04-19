import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_auth.dart';
import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/botom Bar.dart';

class TicketPrice extends StatefulWidget {
  const TicketPrice({Key? key}) : super(key: key);

  @override
  _TicketPriceState createState() => _TicketPriceState();
}

class _TicketPriceState extends State<TicketPrice> {

  String uid = "";
  late List<Map<String, Object>> ticketPrices;

  @override
  void initState() {
    super.initState();
    getUser();
    getPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotoomBar(
        index: 1,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarr(text: ("Subscription \nDetails")),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tickets Price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsHelp.background,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {

                print(uid);
                context.read<AuthService>().checkWallet(
                    uid: uid, noOfStations: "9", price: 5, context: context);

                /*showAnimatedDialog(
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
                );*/
              },
              child: Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/tick.png",
                            height: 60,
                            width: 60,
                            filterQuality: FilterQuality.high,
                          ),
                          Text(
                            "9 Station",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "5 L.E",
                        style: TextStyle(
                            color: ColorsHelp.backgroundG,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {

                context.read<AuthService>().checkWallet(
                    uid: uid, noOfStations: "10-16", price: 7, context: context);
                /*showAnimatedDialog(
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
                );*/
              },
              child: Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/tick.png",
                            height: 60,
                            width: 60,
                            filterQuality: FilterQuality.high,
                          ),
                          Text(
                            "10-16 Station  ",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "7 L.E",
                        style: TextStyle(
                            color: ColorsHelp.backgroundG,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthService>().checkWallet(
                    uid: uid, noOfStations: "16+", price: 10, context: context);
                /*showAnimatedDialog(
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
                );*/
              },
              child: Container(
                height: 80,
                width: 320,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/tick.png",
                            height: 60,
                            width: 60,
                            filterQuality: FilterQuality.high,
                          ),
                          Text(
                            "16+ Station",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "10 L.E",
                        style: TextStyle(
                            color: ColorsHelp.backgroundG,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("uid") ?? "";
      log("uid: $uid}");
    });
    //return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);
  }

  Future<void> getPrices() async {
    CollectionReference ticketPricesReference =
    FirebaseFirestore.instance.collection('Tickets_Prices');

    await ticketPricesReference.where('uid', isEqualTo: uid).orderBy("order").get().then((value) {

      value.docs.forEach((result) {
        setState(() {
          ticketPrices.add({"noOfStations": result.get("noOfStations")});
          ticketPrices.add({"price": result.get("price")});

          print(ticketPrices[0]);
        });


      });


    });
  }
}
