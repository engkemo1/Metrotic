
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrotic/View/SignIn.dart';

class BackGroundSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return
      Container(

        width: width,
        decoration: BoxDecoration(
          color: const Color(0xff00334a),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),


        ),
        child: Column(children: [

          SizedBox(
            height: height*0.10-50,
          ),
          Center(
              child:
              Image.asset("assets/logo.png",)

          )
          ,
          SizedBox(height:    height*0.10-55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
                },
                child:   Container(

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
              ),
              Column(children: [

                Container(
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
                SizedBox(height: 2,)
                ,
                SvgPicture.string(
                  _svg_bao9z,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ],)

            ],
          )


        ],),
      );





  }
}
const String _svg_bao9z =
    '<svg viewBox="256.8 231.0 128.4 1.0" ><path transform="translate(256.78, 231.0)" d="M 0 0 L 128.4338989257812 0" fill="none" stroke="#00da82" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
