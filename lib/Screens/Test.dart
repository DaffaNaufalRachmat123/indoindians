import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  TestState createState () => TestState();
}

class TestState extends State<Test> {
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      body : Container(
      ),
      bottomNavigationBar: Container(
        height : 80,
        width : double.maxFinite,
        decoration : BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
              ),
            ],
            color: Colors.white,
            border : Border.all(width : 1 , color : Colors.black),
            borderRadius : BorderRadius.only(topLeft : Radius.circular(40) , topRight : Radius.circular(40)),
        ),
        child : BottomNavigationBar(
          items : [
            BottomNavigationBarItem(
              icon : Icon(Icons.home , color : Colors.blue),
              title : Text("Home")
            ),
            BottomNavigationBarItem(
              icon : Icon(Icons.ac_unit , color : Colors.blue),
              title : Text('AC Unit')
            )
          ]
        )
      ),
    );
  }
}