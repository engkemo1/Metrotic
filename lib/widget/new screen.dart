import 'package:flutter/material.dart';

import '../View/HomScreen.dart';
import '../View/menu.dart';


class HomeNew extends StatefulWidget {
  const HomeNew({Key? key}) : super(key: key);

  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:Center(
                child: MediaQuery.of(context).size.width < 500 ? Home() :
                Row(
                    children: [
                      Container(
                          width: 400.0,
                          child: Menu()
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width-100.0,
                          child: Home()
                      )
                    ]
                )
            )
        ));
  }
}