
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/PickImage.dart';
import '../helper.dart';
import '../models/user.dart';
import '../widget/AppBar.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {


  String email= "";
  String name= "";
  String phone = "";
  String tagID = "";
  String nationalID = "";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GetImage>(context);

    return Scaffold(
        bottomNavigationBar: BotoomBar(index: 5,),

        body: SafeArea(child: ListView(children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.center,children: [  AppBarr(text: "Edit Information"),
            SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [  Person(high: 150, width: 150, color: ColorsHelp.background, color2: Colors.white, size: 100, reduis: 150),
              InkWell(
                onTap: () {
                  showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsHelp.background,
                              borderRadius: BorderRadius.circular(20)),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child:  GestureDetector(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30)),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: const Color(0xff00334a),
                                          size: 35,
                                        ),
                                      ),
                                      Text(

                                        "Camera",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,

                                            fontSize: 15,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),],
                                  ),
                                  onTap: () {
                                    provider.getImage(ImageSource.camera);
                                  },
                                ),),
                              Container(
                                child:  GestureDetector(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30)),
                                        child: Icon(
                                          Icons.photo,
                                          color: const Color(0xff00334a),
                                          size: 35,
                                        ),
                                      ),
                                      Text(

                                        "Gallery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),],
                                  ),
                                  onTap: () {
                                    provider.getImage(ImageSource.gallery);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    animationType: DialogTransitionType.size,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 1),
                  );
                },
                child: Image.asset(
                  "assets/edit.png",
                  height: 30,
                  width: 30,
                ),
              )
            ],),


            Container(
                height: 120,
                child: Center(
                  child: ListTile(
                      title:Text(
                        'Your Name ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: ColorsHelp.background),
                        controller: TextEditingController()..text = 'Kamal magdy kamal',
                        onChanged: (text) => {},
                        decoration: InputDecoration(
                          hintText: "Kamal Magdy kamal",
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                      )
                  ),
                )),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),Container(
                height: 120,
                child: Center(
                  child: ListTile(
                      title:Text(
                        'Phone Number ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: ColorsHelp.background),
                        controller: TextEditingController()..text = '01133443233',
                        onChanged: (text) => {},
                        decoration: InputDecoration(
                          hintText: "+20 01142589810",
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                      )
                  ),
                )),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),Container(
                height: 120,
                child: Center(
                  child: ListTile(
                      title:Text(
                        'National ID ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: ColorsHelp.background),
                        controller: TextEditingController()..text = '1221212212212',
                        onChanged: (text) => {},
                        decoration: InputDecoration(
                          hintText: "13231323332123",
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                      )
                  ),
                )),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),
            Container(
              height: 120,
              child: Center(
                  child: ListTile(
                      title:Text(
                        'TagID ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: ColorsHelp.background),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                        controller: TextEditingController()..text = '1221212212212',
                        onChanged: (text) => {},
                      )
                  )
              ),
            ),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),
            Container(
              height: 120,
              child: Center(
                  child: ListTile(
                      title:Text(
                        'Email ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: ColorsHelp.background),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                        controller: TextEditingController()..text = email,
                        onChanged: (text) => {},
                      )
                  )
              ),
            ),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),
            Container(
              height: 120,
              child: Center(
                  child: ListTile(
                      title:Text(
                        'Password ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: const Color(0xff00334a),
                          height: 1.5833333333333333,
                        ),

                      ),
                      subtitle:TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: ColorsHelp.background),
                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: InputBorder.none,

                        ),
                        controller: TextEditingController()..text = '1221212212212',
                        onChanged: (text) => {},
                      )
                  )
              ),
            ),
          ],



          ),

        ],)));
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();




    setState(() {
      email = prefs.getString("email") ?? "22";
      name = prefs.getString("name") ?? "";
      phone = prefs.getString("phone") ?? "";
      tagID = prefs.getString("tagID") ?? "";
      nationalID = prefs.getString("nationalID") ?? "";

    });
    log("email: $email");
    //return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);


  }
}
