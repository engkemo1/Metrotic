import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metrotic/Controller/PickImage.dart';
import 'package:metrotic/View/SignUp.dart';
import 'package:provider/provider.dart';

import 'View/SignIn.dart';
import 'View/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
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
      //home: Splash(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/sign_in': (context) => SignIn(),
        '/sign_up': (context) => SignUp(),

      },
    );
  }
}