import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import '../widget/AppBar.dart';
import '../widget/botom Bar.dart';
import 'Edit Information.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(index: 5),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarr(text: "Setting"),
            GestureDetector(onTap: (){                        Navigator.push(context, MaterialPageRoute(builder: (_)=>EditInfo()));
            },child:   Container(
                height: 120,
                child: Center(
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.green,size: 30,),
                    title: Text(
                      "Edit Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: const Color(0xff00334a),
                      ),
                    ),
                    subtitle: Text(
                      'Edit your profile information ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: const Color(0xff00334a),
                        height: 1.5833333333333333,
                      ),
                    ),
                  ),
                )),),
              Divider(
                color: ColorsHelp.background,
                thickness: 2,
              ),
             GestureDetector(onTap: (){},child:  Container(
                 height: 120,
                 child: Center(
                   child: ListTile(
                     trailing: Icon(Icons.arrow_forward_ios,color: Colors.green,size: 30,),

                     title: Text(
                       "Language",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                         fontFamily: 'Montserrat',
                         color: const Color(0xff00334a),
                       ),
                     ),
                     subtitle: Text(
                       'Change your Language ',
                       style: TextStyle(
                         fontFamily: 'Montserrat',
                         fontSize: 12,
                         color: const Color(0xff00334a),
                         height: 1.5833333333333333,
                       ),
                     ),
                   ),
                 )),),
              Divider(
                color: ColorsHelp.background,
                thickness: 2,
              ),
             GestureDetector(
               onTap: (){},
               child:  Container(
                 height: 120,
                 child: Center(
                   child: ListTile(
                     trailing: Icon(Icons.arrow_forward_ios,color: Colors.green,size: 30,),

                     title: Text(
                       "Payment",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                         fontFamily: 'Montserrat',
                         color: const Color(0xff00334a),
                       ),
                     ),
                     subtitle: Text(
                       'Control all Payment Method',
                       style: TextStyle(
                         fontFamily: 'Montserrat',
                         fontSize: 12,
                         color: const Color(0xff00334a),
                         height: 1.5833333333333333,
                       ),
                     ),
                   ),
                 )),),
              Divider(
                color: ColorsHelp.background,
                thickness: 2,
              ),
              SizedBox(height: 20,),
              Center(child:GestureDetector(
                onTap: (){},
                child:  Text(
                "Sign Out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  color: const Color(0xff00334a),
                ),
              ),))
            ],
          ),
        ));
  }
}
