import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(29.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),

        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        GestureDetector(
          onTap: (){},
          child: Image.asset("assets/money.png"),

        ),

        GestureDetector(onTap: (){
        },
          child: Image.asset("assets/location.png"),
        ),


        GestureDetector(onTap: (){},
          child: Image.asset("assets/user.png"),

        ),


        GestureDetector(onTap: (){},
          child: Image.asset("assets/Notifiation.png"),
        ),
        GestureDetector(onTap: (){},child: Image.asset("assets/setting.png"),),


      ],),
    );
  }
}