import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/View/addNewPaymnent.dart';

import '../firebase_auth.dart';
import '../helper.dart';
import '../widget/AppBar.dart';
import '../widget/botom Bar.dart';

class RechargeBalance extends StatefulWidget {
  const RechargeBalance({Key? key}) : super(key: key);

  @override
  State<RechargeBalance> createState() => _RechargeBalanceState();
}

class _RechargeBalanceState extends State<RechargeBalance> {
  String uid = "";
  int balance = 0;
  String walletId = '';
  String selectedCard = "Select your Card";


  final TextEditingController paymentController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 1,
        ),
        body: SafeArea(
            child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarr(text: "Recharge Balance"),
              Container(
                child: Card(
                  margin: EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white)),
                  elevation: 10,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your balance: $balance LE',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Recharge your balance',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: paymentController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      labelText: "Amount to pay",
                      hintText: "20",
                      suffixIcon: Icon(Icons.currency_pound_sharp)),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(0)),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Cards')
                              .where('uid', isEqualTo: uid)
                              .snapshots(),
                          builder: (context, snapshot) {

                            if (!snapshot.hasData) {
                              return const Center(
                                child: const CupertinoActivityIndicator(),
                              );
                            }
                            if(snapshot.data!.docs.isNotEmpty){
                              selectedCard = snapshot.data!.docs[0].get('cardNumber');
                            }

                            return DropdownButton<String>(
                              value: selectedCard,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              icon: const Icon(Icons.arrow_drop_down),
                              //elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 0,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCard = newValue!;
                                });
                              },
                              items: snapshot.data!.docs.map<DropdownMenuItem<String>>(
                                  (DocumentSnapshot document) {
                                    return DropdownMenuItem<String>(
                                  value: document.get('cardNumber'),
                                  child: Text(document.get('cardNumber')),
                                );
                              }).toList(),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            labelText: "CVV",
                            hintText: "***",
                            suffixIcon: Icon(Icons.credit_card)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(
                          40), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      context.read<AuthService>().rechargeWallet(
                        walletId: walletId,
                          balance: balance + int.parse(paymentController.text) ,
                          context: context);
                    },
                    child: Text("Recharge")),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(
                          40), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AddNewPayment()));
                    },
                    child: Text("Add Card")),
              ),
            ],
          ),
        ])));
  }

  Future<void> getBalance() async {
    final prefs = await SharedPreferences.getInstance();

    uid = prefs.getString("uid") ?? "";

    CollectionReference walletsReference =
        FirebaseFirestore.instance.collection('Wallets');
    await walletsReference.where('uid', isEqualTo: uid).get().then((value) {
      value.docs.forEach((result) {
        setState(() {
          balance = result.get('balance');
          print(result.id);
          walletId = result.id;
        });
      });
    });
  }
}
