

import 'package:flutter/material.dart';
import 'package:metrotic/View/supsciptions/SupDetails2.dart';
import 'package:metrotic/widget/AppBar.dart';
import 'package:metrotic/widget/botom%20Bar.dart';
import 'dart:ui' as ui;

import '../../helper.dart';

class SupscripDetails1 extends StatefulWidget {
  const SupscripDetails1({Key? key}) : super(key: key);

  @override
  _SupscripDetails1State createState() => _SupscripDetails1State();
}

class _SupscripDetails1State extends State<SupscripDetails1>with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool upDown = true;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(seconds: 5),

      vsync: this,
    );

    _animation = new CurvedAnimation(
      parent: _controller!,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    final double _height = logicalSize.height;

    void _up(){
      setState((){
        if(upDown) {
          upDown = false;
          _controller?.forward(from: 0.0);
        } else {
          upDown = true;
          _controller?.reverse(from: 1.0);
        }
      });
    }
    return Scaffold(bottomNavigationBar: BotoomBar(index: 1,),body: SafeArea(child:Column(
      children: [
        AppBarr(text: ("Subscription \nDetails")),
        SizedBox(
          height: _height*0.10,
        ),
        AnimatedBuilder(animation: _animation!, builder: ( context,  child){
          return GestureDetector(
            onTap:(){ Navigator.push(context,
                MaterialPageRoute(builder: (_) => SupDet1()));} ,child:  Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
                color: ColorsHelp.background,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 3),
                      blurRadius: 3,
                      color: Colors.grey)
                ]),
            child: Row(children: [
              SizedBox(width: 15,),

              Image.asset("assets/mon.png",height: 60,width: 60,filterQuality: FilterQuality.high,),
              SizedBox(width: 15,),
              Text(
                'Tickets Price',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ],),

          ),
          );
        }

        

        ),
        SizedBox(height: 40,),
        Divider(color: ColorsHelp.background,thickness: 2,),
        SizedBox(height: 40,),

        AnimatedBuilder(animation: _animation!, builder: ( context,  child){
          return GestureDetector(
            onTap:(){} ,child:  Container(
            height: 150,
            width: 300,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

Image.asset("assets/cash.png",height: 50,width: 50,),
              SizedBox(width: 20,),
              Text(
                'Plans',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ],),

          ),
          );
        }



        ),

      ],
    ) ));
  }
}
