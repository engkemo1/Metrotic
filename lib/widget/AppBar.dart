import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrotic/View/Profile2.dart';
import 'package:metrotic/View/menu.dart';
import 'package:metrotic/widget/Person.dart';


class AppBarr extends StatelessWidget {
  final String text;

  const AppBarr({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff00334a),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            blurRadius: 1,
            offset: Offset(1, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
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
                        width: 40,
                        height: 40,
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
