import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrotic/widget/Verfiey.dart';

import 'HomScreen.dart';



class Verification extends StatelessWidget {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SafeArea(
          child:ListView(

            children: <Widget>[
              Column(
                  children: <Widget>[

                    Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      child:
                      Stack(
                        children: [

                          Container(
                              height: MediaQuery.of(context).size.height*0.3+50,
                              decoration: BoxDecoration(
                                color: const Color(0xff00334a),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                              ),
                              child:Column(children: [


                                SizedBox(height:    height*0.12),


                                Center(
                                    child: Image.asset("assets/logo.png")
                                )
                              ],)
                          ),



                          Positioned(child: Align(
                            alignment: Alignment(0.002, -0.283),
                            child:
                            Container(
                              width: 156,
                              height: 156,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                              ),
                              margin: EdgeInsets.fromLTRB(15.8, 20.1, 16.4, 12.1),
                              child:   SizedBox.expand(
                                  child: SvgPicture.string(

                                    _svg_wd2,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                            ),


                          ),
                            top: MediaQuery.of(context).size.height*0.25,
                            left: 50,
                            right:50,),


                        ],
                      ),

                    ),
                    SizedBox(height: 20,)

                    ,
                    SizedBox(
                      width: 114.0,
                      height: 16.0,
                      child: Text(
                        'Confirm Account',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: const Color(0xff00334a),
                          fontWeight: FontWeight.w500,
                          height: 1.5384615384615385,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.only(left :width>400?width*0.25:width>1000?0.50: 25,right:width>400?width*0.25:width>1000?0.50: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            OtpInput(_fieldOne,true),
                            OtpInput(_fieldTwo,false),
                            OtpInput(_fieldThree,false),
                            OtpInput(_fieldFour,false),
                            OtpInput(_fieldFive,false),

                          ]
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));

                      },
                      child:  Container(
                          width: 120.0,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff00334a),
                            borderRadius: BorderRadius.circular(28.0),
                          ),   child: Center(child: Text(
                        'confirm',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.65,
                          fontWeight: FontWeight.w700,
                          height: 1.2307692307692308,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),)
                      ),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      '* Code sent to your phone number *',
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
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Text(
                        'Didn\'t receive your code ?',
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
                    ),
                    SizedBox(height: 10,),





                  ]

              )
            ],
          ),)
    );
  }
}

const String _svg_wd2 =
    '<svg viewBox="154.0 293.7 156.2 156.2" ><path transform="translate(154.0, 293.12)" d="M 78.09616088867188 0.5625 C 34.95432662963867 0.5625 0 35.51682281494141 0 78.65865325927734 C 0 121.8004837036133 34.95432662963867 156.7548217773438 78.09616088867188 156.7548217773438 C 121.2379837036133 156.7548217773438 156.1923217773438 121.8004837036133 156.1923217773438 78.65865325927734 C 156.1923217773438 35.51682281494141 121.2379837036133 0.5625 78.09616088867188 0.5625 Z M 78.09616088867188 30.79327011108398 C 93.40047454833984 30.79327011108398 105.8076934814453 43.20047760009766 105.8076934814453 58.50480651855469 C 105.8076934814453 73.80913543701172 93.40047454833984 86.21635437011719 78.09616088867188 86.21635437011719 C 62.79183197021484 86.21635437011719 50.38461685180664 73.80913543701172 50.38461685180664 58.50480651855469 C 50.38461685180664 43.20048141479492 62.79182434082031 30.79327011108398 78.09616088867188 30.79327011108398 Z M 78.09616088867188 139.1201934814453 C 59.61129760742188 139.1201934814453 43.04735946655273 130.7437744140625 31.96273994445801 117.6437454223633 C 37.8829345703125 106.4961547851562 49.47139358520508 98.81250762939453 62.98077392578125 98.81250762939453 C 63.73654174804688 98.81250762939453 64.4923095703125 98.9384765625 65.21659088134766 99.15889739990234 C 69.31034088134766 100.4814987182617 73.59303283691406 101.3317413330078 78.09616088867188 101.3317413330078 C 82.59927368164062 101.3317413330078 86.91346740722656 100.4814987182617 90.97573089599609 99.15889739990234 C 91.70000457763672 98.93846130371094 92.45577239990234 98.81250762939453 93.21153259277344 98.81250762939453 C 106.7209243774414 98.81250762939453 118.3093719482422 106.4961624145508 124.2295761108398 117.6437454223633 C 113.1449508666992 130.7437744140625 96.58101654052734 139.1201934814453 78.09616088867188 139.1201934814453 Z" fill="#00334a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
