// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../models/user.dart';
//
// class AuthService {
//   final auth.FirebaseAuth _firebaseAuth;
//
//   AuthService(this._firebaseAuth);
//
//   User? _userFromFirebase(auth.User user){
//     if(user == null){
//       return null;
//     }
//
//     return User(user.uid, user.email);
//   }
//
//
//   Stream<User?> get user => _firebaseAuth.authStateChanges().map(_userFromFirebase);
//
//   CollectionReference usersReference = FirebaseFirestore.instance.collection('Users') ;
//
//   Future<void> register({required String name, required String email,
//     required String phone, required String tagID, required String nationalID}) async {
//     await usersReference.add({
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'tagID': tagID,
//       'nationalID': nationalID,
//     });
//   }
//
//   Future<String> signIn({required String email, required String password}) async {
//     try{
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return "Signed in";
//     } on auth.FirebaseAuthException catch(e){
//       return e.message;
//     }
//   }
//
//   Future<String> signUp({required String email, required String password, required String name,
//     required String phone, required String tagID, required String nationalID}) async {
//     try{
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       register(name: name, email: email, phone: phone, tagID: tagID, nationalID: nationalID);
//       return "Signed in";
//     } on auth.FirebaseAuthException catch(e){
//       return e.message;
//     }
//   }
//
//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
//
// }