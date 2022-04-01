import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../View/Profile2.dart';
import '../View/menu.dart';
import 'Person.dart';


class AppBarr extends StatelessWidget {
  final String text;

  const AppBarr({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1-3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff00334a),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),

      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(children: [
               IconButton(
                 onPressed: () {Navigator.of(context).pop();
                 },
                 icon: Icon(
                   Icons.arrow_back_ios,
                   color: Colors.green,
                   size: 30,
                 ),
               ),
               Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
             ],),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Profile()));

                      },
                      child: Person(
                        high: 50,
                        width: 50,
                        color: Colors.white,
                        color2: const Color(0xff00334a), reduis: 30,size: 40,
                      )),
                  SizedBox(width: 10,),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Menu()));


                      },
                      child: Image.asset(
                        "assets/menu.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}