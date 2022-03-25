import 'package:flutter/material.dart';

import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/botom Bar.dart';
import 'SubDet1.dart';
import 'SupDet2.dart';
import 'SupDet3.dart';
class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotoomBar(index: 1,),
      body: SafeArea(child: Column(crossAxisAlignment:CrossAxisAlignment.center,children: [
        AppBarr(text: ("Subscription \nDetails")),
        SizedBox(
          height: 20,
        ),
        Text(
          "Plans",
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
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => SupDet1()));
        },child: Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(color: ColorsHelp.background,borderRadius: BorderRadius.circular(20)),
          child: Center(
           child: Text("Monthly",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)
          ),
        )
          ,),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 2,
          color: ColorsHelp.background,
        ),
        SizedBox(height: 20,),
        GestureDetector(onTap: (){Navigator.push(context,
            MaterialPageRoute(builder: (_) => SupDet2()));},child: Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(color: ColorsHelp.background,borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text("3 Months",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)
          ),
        )
          ,),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 2,
          color: ColorsHelp.background,
        ),
        SizedBox(height: 20,),
        GestureDetector(onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => SupDet3()));
        },child: Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(color: ColorsHelp.background,borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text("Yearly",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)
          ),
        )
          ,)

      ],),),
    );
  }
}
