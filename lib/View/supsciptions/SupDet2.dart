import 'package:flutter/material.dart';

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

            AppBarr(text: ("3Months")),
            SizedBox(
              height: 40,
            ),
            Expandables( price: "185", Destination: " One Zone" , TripPrice: "180", DiscountPercentage: "40"),

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
            Expandables( price: "200", Destination: " Two Zones" , TripPrice: "200", DiscountPercentage: "30"),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),SizedBox(
              height: 20,
            ),
            Expandables( price: "333", Destination: " Three or four Zones" , TripPrice: "333", DiscountPercentage: "30"),

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
            Expandables( price: "400", Destination: "Five or Six Zones" , TripPrice: "400", DiscountPercentage: "40")
          ],
        ),
      ),
    );
  }
}
