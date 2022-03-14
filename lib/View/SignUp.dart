import 'package:flutter/material.dart';
import 'package:metrotic/widget/BackGround%20SignUp.dart';
import 'package:metrotic/widget/PillInput.dart';
import 'verification.dart';
import 'SignIn.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body:SafeArea(child: ListView(
          children: [

            Container(
              height: MediaQuery.of(context).size.height*0.2,
              child: BackGroundSignUp(),
            ),
            SizedBox(
              height: 40,
            ),
       Container(
 padding: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),
         margin: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),

         child: Column(children: [
           TextInput(
               name: "Name",
               hint: "Enter Your Full Name",
             ),


           SizedBox(
             height: 20,
           ),

             TextInput(
               name: "Phone Number",
               hint: "Enter Your Number",

           ),

           SizedBox(
             height: 20,
           ),
           TextInput(
               name: "Email",
               hint: "Enter Your Email",

           ),

           SizedBox(
             height: 20,
           ),
           TextInput(
               name: "Password",
               hint: "Enter Your Password",

           ),


           SizedBox(
             height: 20,
           ),
          TextInput(
               name: "Tag ID",
               hint: "Enter Your Tag ID",

           ),


           SizedBox(
             height: 20,
           ),
          TextInput(
               name: "National ID",
               hint: "Enter Your National ID",

           ),

         ],),
       ),

            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Verification()));
              },
              child: Container(
                  margin: EdgeInsets.only(left:width>1000?width*0.45:width> 400?width*0.40:100,right: width>1000?width*0.45:width> 400?width*0.40:100),

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
            SizedBox(height: 10,)
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
              'Already have an account?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: const Color(0xff00334a),
                height: 1.5714285714285714,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));

                  },
                  child: Text(
                'Log In',

                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: const Color(0xff006032),
                  fontWeight: FontWeight.w700,
                  height: 1.5714285714285714,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),

                )
              ],
            )
          ],
        )));
  }}
