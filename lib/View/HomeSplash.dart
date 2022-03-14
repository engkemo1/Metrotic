
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SignIn.dart';

class HomeSplash extends StatefulWidget {
  const HomeSplash({Key? key}) : super(key: key);

  @override
  _HomeSplashState createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GestureDetector(
        onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (_)=> SignIn()));
        },
        child:  Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            Center(
              child:  Image.asset("assets/logo.png")
            ),
            Pinned.fromPins(
              Pin(size: 1.0, middle: 0.5023),
              Pin(size: 12.0, end: 58.9),
              child: SvgPicture.string(
                _svg_j5h6x8,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 34.0, middle: 0.4038),
              Pin(size: 27.0, end: 51.4),
              child: Text(
                'EN',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  color: const Color(0xff00da82),
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 34.0, middle: 0.5962),
              Pin(size: 27.0, end: 51.4),
              child: GestureDetector(
                onTap: (){},
                child: Text(
                  'AR',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    color: const Color(0xffffffff),
                    letterSpacing: 1.1,
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
        ),
      )
    );
  }
}

const String _svg_j5h6x8 =
    '<svg viewBox="214.5 855.1 1.0 12.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 214.5, 855.13)" d="M 0 0 L 11.97561645507812 0" fill="none" stroke="#00da82" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
