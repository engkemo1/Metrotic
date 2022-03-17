import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:metrotic/Controller/PickImage.dart';
import 'package:metrotic/helper.dart';
import 'package:metrotic/widget/AppBar.dart';
import 'package:metrotic/widget/Person.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GetImage>(context);

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          AppBarr(
            text: "Profile",
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Person(
                    high: 150,
                    width: 150,
                    color: const Color(0xff00334a),
                    color2: Colors.white,
                    size: 140,
                    reduis: 100,
                  ),
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
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              height: 300,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Image.asset(
                          "assets/edit.png",
                          height: 30,
                          width: 30,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.drive_file_rename_outline,
                          color: const Color(0xff00334a),
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "kamal Magdy kamal",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.phone_android_sharp,
                          color: const Color(0xff00334a),
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "+20 01032134411",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: const Color(0xff00334a),
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "kemo@gmail.com",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.perm_identity,
                          color: const Color(0xff00334a),
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "1323323131223111",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                    height: 100,
                    width: w,
                    decoration: BoxDecoration(
                      color: const Color(0xff00334a),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.asset(
                              "assets/ticket.png",
                              height: 35,
                              width: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Last Ticket",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                    height: 100,
                    width: w,
                    decoration: BoxDecoration(
                      color: const Color(0xff00334a),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.asset(
                              "assets/ship.png",
                              height: 35,
                              width: 35,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "1323323111",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ))
        ],
      )),
    );
  }
}
