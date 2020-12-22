import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState () => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      body : Stack(
        children : [
          Container(
            width : MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.height / 0.4,
            decoration : BoxDecoration(
              color : Color.fromARGB(255 , 27 , 42 , 61),
              borderRadius : BorderRadius.only(
                bottomLeft : Radius.circular(20),
                bottomRight : Radius.circular(20)
              )
            )
          )
        ]
      )
    );
  }
}