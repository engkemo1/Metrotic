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
 auth
                width: double.infinity,
                //margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),
                //margin: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),
                child:Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                        labelText: "Email",
                        hintText: "Enter Your Email",
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                        labelText: "Password",
                        hintText: "Enter Your Password",

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