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
        children: <Widget>[
          Container(
            height : MediaQuery.of(context).size.height / 1.1,
            decoration : BoxDecoration(
              color : Color.fromARGB(255 , 27 , 42 , 61),
              borderRadius : BorderRadius.only(
                bottomLeft : Radius.circular(50),
                bottomRight : Radius.circular(50)
              )
            )
          )
        ],
      )
    );
  }
}