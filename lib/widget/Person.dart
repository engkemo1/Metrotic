import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metrotic/Controller/PickImage.dart';
import 'package:provider/provider.dart';

class Person extends StatelessWidget {
  final double high;
  final double width;
  final Color color;
  final Color color2;
  final double size;
  final double reduis;
  const Person(
      {
      required this.high,
      required this.width,
      required this.color,
      required this.color2,
      required this.size,
      required this.reduis });
  

  @override
  Widget build(BuildContext context) {
    
    return Align(
      alignment: Alignment(0.002, -0.283),
      child: Container(
          width: width,
          height: high,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(reduis),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 1,
                offset: Offset(1, 8), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            
            child:Provider.of<GetImage>(context).file !=null?CircleAvatar(radius: 100,backgroundImage: FileImage(Provider.of<GetImage>(context).file!,)): Icon(
              Icons.person,
              color: color2,
              size: size,
            )
          )),
    );
  }
}
