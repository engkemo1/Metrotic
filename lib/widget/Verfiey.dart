import 'package:flutter/material.dart';
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, ) ;

  @override
  Widget build(BuildContext context) {
    return
      Container(
          width: 50.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
                width: 1.0, color: const Color(0xff00334a)),
          ),
          child:Center(
            child:  TextField(
              style: TextStyle(color:const Color(0xff00334a), fontSize: 30.0,fontWeight: FontWeight.bold),
              autofocus: autoFocus,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: controller,
              maxLength: 1,

              decoration: const InputDecoration(
                  border: InputBorder.none,

                  hintText: "*",
                  counterText: "",

                  hintStyle: TextStyle(color:const Color(0xff00334a), fontSize: 30.0,fontWeight: FontWeight.bold)),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          )




      );
  }
}