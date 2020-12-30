import 'package:flutter/material.dart';
import 'package:indoindians/Screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState () => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      body : Container(
        margin : EdgeInsets.symmetric(horizontal : 20),
        child : Center(
            child : SingleChildScrollView(
                child : Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Daftar" , style : TextStyle(
                            color : Colors.black,
                            fontSize : 22,
                            fontFamily: "Times New Roman"
                        )),
                      ],
                    ),
                    SizedBox(height : 25),
                    Form(
                        key : formKey,
                        child : Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Email" , style : TextStyle(
                                    color : Color.fromARGB(255 , 30 , 42 , 56),
                                    fontSize : 15,
                                    fontFamily: "Times New Roman"
                                )),
                              ],
                            ),
                            SizedBox(height : 10),
                            Container(
                                decoration : BoxDecoration(
                                    color : Colors.white,
                                    borderRadius : BorderRadius.circular(5),
                                    border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                ),
                                child : TextFormField(
                                    style : TextStyle(
                                      color : Colors.black,
                                    ),
                                    textAlignVertical : TextAlignVertical.center,
                                    decoration : InputDecoration(
                                        contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                        border : InputBorder.none,
                                        suffixIcon : Icon(
                                            Icons.email,
                                            size : 25,
                                            color : Color.fromARGB(255 , 194 , 194 , 194)
                                        )
                                    )
                                )
                            ),
                            SizedBox(height : 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("First Name" , style : TextStyle(
                                    color : Color.fromARGB(255 , 30 , 42 , 56),
                                    fontSize : 15,
                                    fontFamily: "Times New Roman"
                                )),
                              ],
                            ),
                            SizedBox(height : 10),
                            Container(
                                decoration : BoxDecoration(
                                    color : Colors.white,
                                    borderRadius : BorderRadius.circular(5),
                                    border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                ),
                                child : TextFormField(
                                    style : TextStyle(
                                      color : Colors.black,
                                    ),
                                    textAlignVertical : TextAlignVertical.center,
                                    decoration : InputDecoration(
                                        contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                        border : InputBorder.none,
                                        suffixIcon : Icon(
                                            Icons.lock,
                                            size : 25,
                                            color : Color.fromARGB(255 , 194 , 194 , 194)
                                        )
                                    )
                                )
                            ),
                            SizedBox(height : 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Last Name" , style : TextStyle(
                                    color : Color.fromARGB(255 , 30 , 42 , 56),
                                    fontSize : 15,
                                    fontFamily: "Times New Roman"
                                )),
                              ],
                            ),
                            SizedBox(height : 15),
                            Container(
                                decoration : BoxDecoration(
                                    color : Colors.white,
                                    borderRadius : BorderRadius.circular(5),
                                    border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                ),
                                child : TextFormField(
                                    style : TextStyle(
                                      color : Colors.black,
                                    ),
                                    textAlignVertical : TextAlignVertical.center,
                                    decoration : InputDecoration(
                                        contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                        border : InputBorder.none,
                                        suffixIcon : Icon(
                                            Icons.lock,
                                            size : 25,
                                            color : Color.fromARGB(255 , 194 , 194 , 194)
                                        )
                                    )
                                )
                            ),
                            SizedBox(height : 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Password" , style : TextStyle(
                                    color : Color.fromARGB(255 , 30 , 42 , 56),
                                    fontSize : 15,
                                    fontFamily: "Times New Roman"
                                )),
                              ],
                            ),
                            SizedBox(height : 15),
                            Container(
                                decoration : BoxDecoration(
                                    color : Colors.white,
                                    borderRadius : BorderRadius.circular(5),
                                    border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                ),
                                child : TextFormField(
                                    style : TextStyle(
                                      color : Colors.black,
                                    ),
                                    textAlignVertical : TextAlignVertical.center,
                                    decoration : InputDecoration(
                                        contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                        border : InputBorder.none,
                                        suffixIcon : Icon(
                                            Icons.lock,
                                            size : 25,
                                            color : Color.fromARGB(255 , 194 , 194 , 194)
                                        )
                                    )
                                )
                            ),
                          ],
                        )
                    ),
                    SizedBox(height : 10),
                    SizedBox(height : 15),
                    Material(
                        child : InkWell(
                            onTap : (){

                            },
                            child : Container(
                                width : MediaQuery.of(context).size.width,
                                height : 50,
                                decoration : BoxDecoration(
                                    borderRadius : BorderRadius.circular(10),
                                    color : Color.fromARGB(255 , 27 , 42 , 61)
                                ),
                                alignment : Alignment.center,
                                child : Text("Daftar" , style : TextStyle(
                                    color : Colors.white,
                                    fontSize : 15 ,
                                    fontFamily : "Times New Roman"
                                ))
                            )
                        )
                    ),
                    SizedBox(height : 15),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Sudah punya akun IndoIndianshop?" , style : TextStyle(
                            color : Color.fromARGB(255 , 27 , 42 , 61),
                            fontFamily : "Times New Roman",
                            fontSize : 15
                        ))
                      ],
                    ),
                    SizedBox(height : 10),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            onTap : () {
                              Navigator.pop(context);
                            },
                            child : Text("Masuk Kesini" , style : TextStyle(
                                color : Color.fromARGB(255 , 27 , 42 , 61),
                                fontFamily : "Times New Roman",
                                fontSize : 16,
                                fontWeight : FontWeight.bold
                            ))
                        )
                      ],
                    )
                  ],
                )
            )
        )
      )
    );
  }
}