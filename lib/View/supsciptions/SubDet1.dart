import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/Expandable.dart';
import '../../widget/botom Bar.dart';

class SupDet1 extends StatefulWidget {
  const SupDet1({Key? key}) : super(key: key);

  @override
  _SupDet1State createState() => _SupDet1State();
}

class _SupDet1State extends State<SupDet1> {
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
            AppBarr(text: ("Monthly")),
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
