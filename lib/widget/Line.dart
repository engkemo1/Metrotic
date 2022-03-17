

import 'package:flutter/material.dart';

import '../helper.dart';
class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.only(left: 5),
            height: 20,
            width: 2,
            decoration: BoxDecoration(
                color: ColorsHelp.background,
                borderRadius: BorderRadius.circular(20)),
          ),




        ],
      ),



    );
  }
}
