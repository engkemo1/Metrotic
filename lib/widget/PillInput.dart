import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String name;
  final String hint;

  const TextInput({required this.name, required this.hint}) ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,

      decoration: InputDecoration(
        hintText: hint,
        labelText: name,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),

    );
  }
}