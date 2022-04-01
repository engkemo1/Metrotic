
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/PickImage.dart';

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
