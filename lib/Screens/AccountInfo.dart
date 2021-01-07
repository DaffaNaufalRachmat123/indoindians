import 'package:clippy_flutter/trapezoid.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Login/LoginBloc.dart';
import 'package:indoindians/Blocs/Login/LoginState.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Components/NavigationDrawer.dart';

import 'ChangePasswordScreen.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : ( context ) => LoginBloc(AuthenticationBloc() , CustomerModel()),
      child : Account()
    );
  }
}

class Account extends StatefulWidget {
  @override
  AccountState createState () => AccountState();
}

class AccountState extends State<Account>{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Route _createRouteChangePasswordScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ChangePasswordScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  @override
  Widget build ( BuildContext context ){
    return BlocListener<LoginBloc , LoginState>(
      listener : ( context , state ){

      },
      child : BlocBuilder<LoginBloc , LoginState>(
        builder : ( context , state ){
          return Scaffold(
              key : scaffoldKey,
              drawer : NavigationDrawer(),
              body : Container(
                  child : Stack(
                    children: <Widget>[
                      Container(
                          width : MediaQuery.of(context).size.width,
                          height : MediaQuery.of(context).size.height / 12,
                          color : Color.fromARGB(255 , 27 , 42 , 61)
                      ),
                      Container(
                          margin : EdgeInsets.only(top : 30),
                          width : MediaQuery.of(context).size.width,
                          height : MediaQuery.of(context).size.height,
                          color : Colors.white
                      ),
                      Container(
                          margin : EdgeInsets.only(bottom : 80),
                          child : SafeArea(
                            child : Container(
                              color : Colors.white,
                              child: SingleChildScrollView(
                                  child : Stack(
                                    children: <Widget>[
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Container(
                                              width : MediaQuery.of(context).size.width,
                                              child : Row(
                                                mainAxisAlignment : MainAxisAlignment.spaceBetween ,
                                                children: <Widget>[
                                                  InkWell(
                                                      onTap : (){

                                                      },
                                                      child : Container(
                                                          margin : EdgeInsets.only(left : 10),
                                                          child : InkWell(
                                                              onTap : (){
                                                                scaffoldKey.currentState.openDrawer();
                                                              },
                                                              child : Image.asset("icon_dashboard.png" , width : 25 , height : 25 , color : Colors.black)
                                                          )
                                                      )
                                                  ),
                                                  Expanded(
                                                      child : Row(
                                                        mainAxisAlignment : MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                              margin : EdgeInsets.only(left : 60 , bottom : 3),
                                                              child : Trapezoid(
                                                                  cutLength : 25.0,
                                                                  edge : Edge.BOTTOM,
                                                                  child : GestureDetector(
                                                                      child : Container(
                                                                          padding : EdgeInsets.only(left : 50, right : 50),
                                                                          decoration : BoxDecoration(
                                                                              color: Color.fromARGB(255 , 27 , 42 , 61),
                                                                              borderRadius : BorderRadius.only(topLeft : Radius.circular(-10) , topRight : Radius.circular(-10))
                                                                          ),
                                                                          height : 30.0,
                                                                          child : Row(
                                                                            mainAxisAlignment : MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              Text("IND" , style : TextStyle(
                                                                                  color : Colors.white,
                                                                                  fontSize : 10,
                                                                                  fontWeight : FontWeight.bold
                                                                              )),
                                                                              Image.asset("indoindians_logo.png" , width : 20 , height : 20),
                                                                              Text("INDIANS" , style : TextStyle(
                                                                                  color : Colors.white,
                                                                                  fontSize : 10,
                                                                                  fontWeight : FontWeight.bold
                                                                              ))
                                                                            ],
                                                                          )
                                                                      )
                                                                  )
                                                              )
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                  Row(
                                                    mainAxisAlignment : MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      InkWell(
                                                          onTap : (){

                                                          },
                                                          child : Image.asset("icon_keranjang.png" , width : 25 , height : 25 , color : Colors.black)
                                                      ),
                                                      SizedBox(width : 10),
                                                      InkWell(
                                                          onTap : (){

                                                          },
                                                          child : Image.asset("icon_wishlist.png" , width : 25 , height : 25 , color : Colors.black)
                                                      ),
                                                      InkWell(
                                                          onTap : (){

                                                          },
                                                          child : Image.asset("icon_notification.png" , width : 25 , height : 25 , color : Colors.black)
                                                      ),
                                                      SizedBox(width : 10)
                                                    ],
                                                  )
                                                ],
                                              )
                                          ),
                                          Container(
                                              margin : EdgeInsets.only(left : 30 , right : 30 , top : 50),
                                              child : Column(
                                                children: <Widget>[
                                                  InkWell(
                                                      onTap : (){
                                                        Navigator.push(context , MaterialPageRoute(
                                                            builder : ( context ) => AccountInfo()
                                                        ));
                                                      },
                                                      child : Row(
                                                        mainAxisAlignment : MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.person_pin,
                                                              size : 25,
                                                              color : Colors.black
                                                          ),
                                                          SizedBox(width : 5),
                                                          Text("Account Information" , style : TextStyle(
                                                              color : Colors.black,
                                                              fontFamily : 'Times New Roman',
                                                              fontSize : 17
                                                          ))
                                                        ],
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height : 10),
                                          Container(
                                              width : MediaQuery.of(context).size.width,
                                              margin : EdgeInsets.symmetric(horizontal : 20),
                                              height : 0.5,
                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                          ),
                                          Container(
                                              margin : EdgeInsets.only(left : 30 , right : 30 , top : 10),
                                              child : Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment : MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width : 5),
                                                      Text("Name : " , style : TextStyle(
                                                          color : Colors.black,
                                                          fontFamily : 'Times New Roman',
                                                          fontSize : 15.5
                                                      )),
                                                      Text("Jakha Surya" , style : TextStyle(
                                                        color : Colors.black,
                                                        fontFamily : "Times New Roman",
                                                        fontSize : 15.5
                                                      ))
                                                    ],
                                                  ),
                                                  SizedBox(height : 20),
                                                  Row(
                                                    mainAxisAlignment : MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width : 5),
                                                      Text("Email : " , style : TextStyle(
                                                          color : Colors.black,
                                                          fontFamily : 'Times New Roman',
                                                          fontSize : 15.5
                                                      )),
                                                      Text("jakhasurya@gmail.com" , style : TextStyle(
                                                          color : Colors.black,
                                                          fontFamily : "Times New Roman",
                                                          fontSize : 15.5
                                                      ))
                                                    ],
                                                  ),
                                                  SizedBox(height : 20),
                                                  Row(
                                                    mainAxisAlignment : MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width : 5),
                                                      Text("Phone : " , style : TextStyle(
                                                          color : Colors.black,
                                                          fontFamily : 'Times New Roman',
                                                          fontSize : 15.5
                                                      )),
                                                      Text("0838-9094-4476" , style : TextStyle(
                                                          color : Colors.black,
                                                          fontFamily : "Times New Roman",
                                                          fontSize : 15.5
                                                      ))
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height : 15),
                                          Container(
                                              margin : EdgeInsets.only(left : 30 , right : 30 , top : 10),
                                              child : Column(
                                                children: <Widget>[
                                                  InkWell(
                                                      onTap : () async {
                                                        var response = await Navigator.push(context , _createRouteChangePasswordScreen());
                                                        if(response != null){
                                                          if(response["is_change_success"] == true){
                                                            successDialog(context ,
                                                                "Berhasil Ubah Password");
                                                          }
                                                        }
                                                      },
                                                      child : Row(
                                                        mainAxisAlignment : MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.lock,
                                                              size : 25,
                                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                                          ),
                                                          SizedBox(width : 5),
                                                          Text("Edit Change Password" , style : TextStyle(
                                                              color : Color.fromARGB(255 , 27 , 42 , 61),
                                                              fontFamily : 'Times New Roman',
                                                              fontSize : 16
                                                          ))
                                                        ],
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height : 10),
                                          Container(
                                              width : MediaQuery.of(context).size.width,
                                              margin : EdgeInsets.symmetric(horizontal : 20),
                                              height : 0.5,
                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                          ),
                                          SizedBox(height : 15),
                                          Container(
                                              margin : EdgeInsets.only(left : 30 , right : 30 , top : 10),
                                              child : Column(
                                                children: <Widget>[
                                                  InkWell(
                                                      onTap : () async {

                                                      },
                                                      child : Row(
                                                        mainAxisAlignment : MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.home,
                                                              size : 25,
                                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                                          ),
                                                          SizedBox(width : 5),
                                                          Text("Edit Address" , style : TextStyle(
                                                              color : Color.fromARGB(255 , 27 , 42 , 61),
                                                              fontFamily : 'Times New Roman',
                                                              fontSize : 16
                                                          ))
                                                        ],
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(height : 10),
                                          Container(
                                              width : MediaQuery.of(context).size.width,
                                              margin : EdgeInsets.symmetric(horizontal : 20),
                                              height : 0.5,
                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          )
                      )
                    ],
                  )
              )
          );
        }
      )
    );
  }
}