import 'package:flutter/material.dart';

import 'AppBar.dart';
class MapMetro extends StatelessWidget {
  const MapMetro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(child: ListView(children: [
          AppBarr(text: "Metro Map"),
          SizedBox(height: 50,),

          Container(
height: MediaQuery.of(context).size.height-100,
            child:
            InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              child:  Image.asset("assets/metroo.png",height: 500,width: 200,fit: BoxFit.cover,),
            ),


          )
        ],),
        ));

  }
}