import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/BackGround.dart';
import '../widget/PillInput.dart';
import 'HomScreen.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                child:  BackGround(),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  padding: EdgeInsets.only(left:width>1000?width*0.17:width> 500?width*0.12:25,right: width>1000?width*0.17:width> 500?width*0.12:25),
                  margin: EdgeInsets.only(left:width>1000?width*0.17:width> 500?width*0.12:25,right: width>1000?width*0.17:width> 500?width*0.12:25),


                  child:
                  Column(
                    children: [
                      TextInput(
                        name: "Phone Number",
                        hint: "Enter Your Number",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInput(
                        name: "Password",
                        hint: "Enter Your Password",
                      ),
                    ],
                  )



              ),


              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));

                },
                child: Container(
                    margin: EdgeInsets.only(left:width>1000?width*0.35:width> 500?width*0.30:70,right: width>1000?width*0.35:width> 500?width*0.30:70),
                    width: 190.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff00334a),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: Center(
                      child: Text(
                        'log in',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.65,
                          fontWeight: FontWeight.w700,
                          height: 1.2307692307692308,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    )),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ));
  }
}