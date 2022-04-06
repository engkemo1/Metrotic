import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class DBService {

  CollectionReference usersReference = FirebaseFirestore.instance.collection('Users') ;


  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    String email = (prefs.getInt("email") ?? "") as String;
    String name = (prefs.getInt("name") ?? "") as String;
    String phone = (prefs.getInt("phone") ?? "") as String;
    String tagID = (prefs.getInt("tagID") ?? "") as String;
    String nationalID = (prefs.getInt("nationalID") ?? "") as String;

    return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);
  }


  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}