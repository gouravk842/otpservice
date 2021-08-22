import 'package:flutter/material.dart';
import 'package:liveasy/lang.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => new _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SplashScreenView(
      navigateRoute: new Lang(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/image/logo.png",
      text: "Liveasy",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.cyan,
    ));
  }
}
