import 'package:flutter/material.dart';

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
  String selectedCard = "Seeker";
  final TextEditingController cardNoController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //getUser();
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
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false),
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

                  controller: cardNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(0.0))),
                      labelText: "Amount to pay",
                      hintText: "20",
                      suffixIcon: Icon(Icons.currency_pound)),
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
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: selectedCard,
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCard = newValue!;
                          });
                        },
                        items: <String>['Seeker', 'Finder']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(

                        controller: cardNoController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                            labelText: "Amount to pay",
                            hintText: "20",
                            suffixIcon: Icon(Icons.currency_pound)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ])));
  }
}
