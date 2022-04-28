import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_auth.dart';
import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/Expandable.dart';
import '../../widget/botom Bar.dart';

class SupDet2 extends StatefulWidget {
  const SupDet2({Key? key}) : super(key: key);

  @override
  _SupDet2State createState() => _SupDet2State();
}

class _SupDet2State extends State<SupDet2> {
  String uid = "";
  List<Map<String, Object>> subscriptionsPrices = <Map<String, Object>>[];

  @override
  void initState() {
    super.initState();
    getUser();
    getSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BotoomBar(
        index: 1,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AppBarr(text: ("3 Months")),
            SizedBox(
              height: 40,
            ),
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[0]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[0]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[0]["subId"].toString());
              },
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
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[1]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[1]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[1]["subId"].toString());
              },
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
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[2]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[2]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[2]["subId"].toString());
              },
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
            Expandables(
                price: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["price"].toString()
                    : "",
                destination: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["destination"].toString()
                    : "",
                tripPrice: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["tripPrice"].toString()
                    : "",
                discountPercentage: subscriptionsPrices.isNotEmpty
                    ? subscriptionsPrices[3]["discount"].toString()
                    : "",
              onPressed: () {
                context.read<AuthService>().checkWallet(
                    uid: uid,
                    noOfStations: '',
                    price:
                    int.parse(subscriptionsPrices[3]["price"].toString()),
                    context: context,
                    ticket: false,
                    subId: subscriptionsPrices[3]["subId"].toString());
              },
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

  Future<void> getSubscriptions() async {
    CollectionReference monthlyReference = FirebaseFirestore.instance
        .collection('Subscriptions_prices')
        .doc('ZZ9xxdI0g0FkRbbnlvXl')
        .collection('Quarterly');

    await monthlyReference.orderBy("order").get().then((value) {
      value.docs.forEach((result) {
        //print(result.data());
        /*addSub(
            destination: result.get("destination"),
            order: result.get("order"),
            discount: result.get("discount"),
            price: result.get("price"),
            tripPrice: result.get("tripPrice"));*/
        setState(() {
          subscriptionsPrices.add({
            "destination": result.get("destination"),
            "price": result.get("price"),
            "tripPrice": result.get("tripPrice"),
            "discount": result.get("discount")
          });
          //ticketPrices.add({"price": result.get("price")});

          print(subscriptionsPrices);
        });
      });

      //print(ticketPrices[0]['price']);
    });
  }
}
