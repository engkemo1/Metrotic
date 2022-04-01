import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/HomScreen.dart';
import '../widget/BackGround SignUp.dart';
import 'firebase_auth.dart';
import 'verification.dart';
import 'SignIn.dart';

class SignUp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        var width =MediaQuery.of(context).size.width;
        final TextEditingController emailController = TextEditingController();
        final TextEditingController passwordController = TextEditingController();
        final TextEditingController nameController = TextEditingController();
        final TextEditingController phoneController = TextEditingController();
        final TextEditingController tagIDController = TextEditingController();
        final TextEditingController nationalIDController = TextEditingController();

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
                        padding: EdgeInsets.only(left:width>1000?width*0.17:width> 500?width*0.12:25,right: width>1000?width*0.17:width> 500?width*0.12:25),
                        margin: EdgeInsets.only(left:width>1000?width*0.17:width> 500?width*0.12:25,right: width>1000?width*0.17:width> 500?width*0.12:25),

                        child: Column(children: [
                            TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                    labelText: "Name",
                                    hintText: "Enter Your Full Name",
                                ),
                                keyboardType: TextInputType.name,
                            ),


                            SizedBox(
                                height: 20,
                            ),

                            TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                    labelText: "Phone Number",
                                    hintText: "Enter Your Number",
                                ),
                                keyboardType: TextInputType.phone,

                            ),

                            SizedBox(
                                height: 20,
                            ),
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
                                keyboardType: TextInputType.visiblePassword,

                            ),


                            SizedBox(
                                height: 20,
                            ),
                            TextField(
                                controller: tagIDController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                    labelText: "Tag ID",
                                    hintText: "Enter Your Tag ID",
                                ),
                                keyboardType: TextInputType.visiblePassword,

                            ),


                            SizedBox(
                                height: 20,
                            ),
                            TextField(
                                controller: nationalIDController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                    labelText: "National ID",
                                    hintText: "Enter Your National ID",
                                ),
                                keyboardType: TextInputType.visiblePassword,

                            ),

                        ],),
                    ),

                    SizedBox(
                        height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                            // context.read<AuthService>().signUp(
                            //     email: emailController.text.trim(),
                            //     password: passwordController.text.trim(),
                            //     name: nameController.text.trim(),
                            //     phone: phoneController.text.trim(),
                            //     tagID: tagIDController.text.trim(),
                            //     nationalID: nationalIDController.text.trim()
                            // );
                            // if(context.read<AuthService>().user!= null){
                            //     Navigator.push(context, MaterialPageRoute(builder: (_)=>Verification()));
                            // }else{
                            //     log("Something wrong");
                            // }


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
                                      'Sign Up',
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
                              ),

                            ),
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
                                    'Login',

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