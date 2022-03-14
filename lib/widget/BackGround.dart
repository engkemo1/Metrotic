import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrotic/View/SignUp.dart';

class BackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    
    return Container(
height:height*0.20,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xff00334a),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          child:Column(
            children: [
              SizedBox(height:    height*0.12),

              Center(
                  child:
                  Image.asset("assets/logo.png")

              ),
              SizedBox(height:  width>400?height*0.17:  height*0.15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(children: [


                      Container(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height:width>400?3: 2,)
                    ,
                    SvgPicture.string(
                      _svg_tfsw8h,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ],),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: Container(

                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),

                ],
              )
            ],
          )


    );



  }
}

const String _svg_tfsw8h =
    '<svg viewBox="42.8 379.0 128.4 1.0" ><path transform="translate(42.78, 379.0)" d="M 0 0 L 128.4338989257812 0" fill="none" stroke="#00da82" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
