import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indoindians/Screens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState () => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      body : Container(
        width : MediaQuery.of(context).size.width,
        height : MediaQuery.of(context).size.height,
        decoration : BoxDecoration(
          image : DecorationImage(
            image : AssetImage("splash_screen_background.jpg"),
            fit : BoxFit.cover
          )
        ),
        child : Center(
          child : Row(
            mainAxisAlignment : MainAxisAlignment.center,
            children: <Widget>[
              Text("IND" , style : TextStyle(
                fontSize : 35,
                color : Colors.white,
                fontFamily : "Times New Roman"
              )),
              Image.asset("indoindians_logo.png" , width : 60 , height : 60),
              Text("INDIANS" , style : TextStyle(
                fontSize : 35,
                color : Colors.white,
                fontFamily : "Times New Roman"
              ))
            ],
          )
        )
      )
    );
  }
}