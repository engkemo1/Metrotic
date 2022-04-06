import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/HomScreen.dart';
import 'View/verification.dart';
import 'models/user.dart' as myUser;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);
/*

  User? _userFromFirebase(auth.User user){
    if(user == null){
      return null;
    }

    return User(uid: user.uid,email: user.email!,name: "" , phone: "", tagID: "", nationalID: "");

  }
*/

  _saveUser(myUser.User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('phone', user.phone);
    prefs.setString('tagID', user.tagID);
    prefs.setString('nationalID', user.nationalID);
  }


  //Stream<User?> get user => _firebaseAuth.authStateChanges().map(_userFromFirebase);

  CollectionReference usersReference = FirebaseFirestore.instance.collection('Users') ;

  Future<String?> resetPassword({required String email}) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Done";
    } on auth.FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future<void> register({required String name, required String email,
    required String phone, required String tagID, required String nationalID,
    required BuildContext context}) async {
    await usersReference.add({
      'name': name,
      'email': email,
      'phone': phone,
      'tagID': tagID,
      'nationalID': nationalID,
    });

    _saveUser(myUser.User(uid: "",email: email,name: name, phone: phone, tagID: tagID, nationalID: nationalID));

    Navigator.of(context).pushReplacementNamed(
        Verification.routeName,
        arguments: {
          //"phone": phoneController.text.trim(),
          "phone": "+2$phone",
        }
    );
  }

  Future<void> signIn({required String email, required String password, required BuildContext context}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      log("Signed in");

      showSnackBar(context, "Signed in");
      getUser(email: email, context: context);
    } on auth.FirebaseAuthException catch(e){

      showSnackBar(context, e.message!);
      log(e.message!);
    }
  }

  Future<void> getUser({required String email, required BuildContext context}) async {
    myUser.User user = myUser.User(uid: "", email: "", name: "", phone: "", tagID: "", nationalID: "");
    await usersReference.where('email', isEqualTo: email)
        .get()
        .then((documentSnapshot) {
          documentSnapshot.docs.forEach((result) {
            user = result.data() as myUser.User;
          });

          _saveUser(user);
    });

    Navigator.of(context).pushReplacementNamed(
        Home.routeName);

  }

  Future<String> verifyPhone({required String phone, required BuildContext context,
    required Function setData}) async {
    try{

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }else{

            print(e.message);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          showSnackBar(context, "Verification Code sent on the phone number");
          setData(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return "Signed in";
    } catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  Future<void> signInWithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);

      Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));

      showSnackBar(context, "verified");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signUp({required String email, required String password, required String name,
    required String phone, required String tagID, required String nationalID, required BuildContext context}) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      showSnackBar(context, "Signed in");
      register(name: name, email: email, phone: phone, tagID: tagID, nationalID: nationalID, context: context);

    } on auth.FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}