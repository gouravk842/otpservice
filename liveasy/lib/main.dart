import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/login.dart';
import 'package:liveasy/otp.dart';
import 'package:liveasy/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Liveasy',
        initialRoute: "splash",
        debugShowCheckedModeBanner: false,
        routes: {
          "splash": (context) => MySplash(),
          "login": (context) => login(),
        });
  }
}
