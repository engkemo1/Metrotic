import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/PickImage.dart';
import 'View/HomScreen.dart';
import 'View/SignIn.dart';
import 'View/SignUp.dart';
import 'View/reset_password.dart';
import 'View/splash.dart';
import 'View/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
    routes: {
    '/': (context) => Splash(),
    '/sign_in': (context) => SignIn(),
    '/sign_up': (context) => SignUp(),
    '/home_screen': (context) => Home(),
    '/verification': (context) => Verification(),
    '/reset_password': (context) => ResetPasswordScreen(),
    }
    );
  }
}