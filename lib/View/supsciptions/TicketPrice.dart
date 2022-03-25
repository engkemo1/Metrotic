import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/botom Bar.dart';

class TicketPrice extends StatefulWidget {
  const TicketPrice({Key? key}) : super(key: key);

  @override
  _TicketPriceState createState() => _TicketPriceState();
}

class _TicketPriceState extends State<TicketPrice> {
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
            SizedBox(height: 20,),

          GestureDetector(onTap: (){
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
          },child:   Container(
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
                    style: TextStyle(color: ColorsHelp.backgroundG,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),),
            SizedBox(height: 20,),
            Divider(thickness: 1,color: ColorsHelp.background,),
            SizedBox(height: 20,),
          GestureDetector(onTap: (){
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
          },child:   Container(
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
                    style: TextStyle(color: ColorsHelp.backgroundG,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: ColorsHelp.background,
            ),
            SizedBox(height: 20,),

           GestureDetector(onTap: (){
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
           },child:  Container(
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
                     style: TextStyle(color: ColorsHelp.backgroundG,fontSize: 15,fontWeight: FontWeight.bold),
                   ),
                 )
               ],
             ),
           ),)
          ],
        ),
      ),
    );
  }
}
