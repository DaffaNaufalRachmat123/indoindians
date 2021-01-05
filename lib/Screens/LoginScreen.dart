import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationEvent.dart';
import 'package:indoindians/Blocs/Login/LoginBloc.dart';
import 'package:indoindians/Blocs/Login/LoginEvent.dart';
import 'package:indoindians/Blocs/Login/LoginState.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Components/CustomDialog.dart';
import 'package:indoindians/Configs/Constant.dart';
import 'package:indoindians/Screens/HomeScreen.dart';
import 'package:indoindians/Screens/RegisterScreen.dart';
import 'package:indoindians/Screens/Test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider<LoginBloc>(
          create : ( context ) => LoginBloc(AuthenticationBloc() , CustomerModel())
        ),
        BlocProvider<AuthenticationBloc>(
          create : ( context ) => AuthenticationBloc()
        )
      ],
      child : LoginScreens()
    );
  }
}

class LoginScreens extends StatefulWidget {
  @override
  LoginScreenState createState () => LoginScreenState();
}

class LoginScreenState extends State<LoginScreens>{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool checkedValue = false;
  bool autovalidate = false;
  bool isEmail = true;
  bool isPassword = true;
  bool isPasswordVisible = false;
  LoginBloc loginBloc;
  @override
  void dispose(){
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    emailController.addListener((){
      if(emailController.text.length > 0){
        setState((){
          isEmail = true;
        });
      } else {
        setState((){
          isEmail = false;
        });
      }
    });
    passController.addListener((){
      if(passController.text.length > 0){
        setState((){
          isPassword = true;
        });
      } else {
        setState((){
          isPassword = false;
        });
      }
    });
    super.initState();
  }
  Widget buildLoginButton(LoginBloc loginBloc){
    return Material(
        child : InkWell(
            onTap : (){
              if(isEmail && isPassword){
                loginBloc.add(LoginWithEmailPassword(
                    username : emailController.text.toString(),
                    password : passController.text.toString(),
                    isRemember: checkedValue
                ));
                print("Hello");
              }
            },
            child : Container(
                width : MediaQuery.of(context).size.width,
                height : 50,
                decoration : BoxDecoration(
                    borderRadius : BorderRadius.circular(10),
                    color : Color.fromARGB(255 , 27 , 42 , 61)
                ),
                alignment : Alignment.center,
                child : Text("Masuk" , style : TextStyle(
                    color : Colors.white,
                    fontSize : 15 ,
                    fontFamily : "Times New Roman"
                ))
            )
        )
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterScreen(),
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
  Route _createRouteHomeScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
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
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc , LoginState>(
      listener : ( context , state ){
        if(state is LoginFailure){
          FocusScope.of(context).requestFocus(FocusNode());
          errorDialog(context,
          state.error,
          );
        } else if(state is LoginSuccess){
          Navigator.pushAndRemoveUntil(context , _createRouteHomeScreen() , (route) => false);
        }
      },
      child : BlocBuilder<LoginBloc , LoginState>(
        builder : ( context , state ){
          return Scaffold(
              backgroundColor: Colors.white,
              body : Center(
                  child : SingleChildScrollView(
                      padding : EdgeInsets.all(30.0),
                      child : Column(
                        crossAxisAlignment : CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Masuk" , style : TextStyle(
                              color : Colors.black,
                              fontSize :  22,
                              fontFamily: "Times New Roman"
                          )),
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
                                          border : Border.all(width : 1.5 , color : isEmail ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                      ),
                                      child : TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller : emailController,
                                          validator : (value){
                                            if(value.length == 0){
                                              setState((){
                                                isEmail = false;
                                              });
                                            } else {
                                              setState((){
                                                isEmail = true;
                                              });
                                            }
                                            return null;
                                          },
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
                                  SizedBox(height : 5),
                                  !isEmail ?
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "Email is required",
                                          style : TextStyle(
                                              color : Colors.red,
                                              fontSize : 14,
                                              fontFamily : "Times New Roman"
                                          )
                                      )
                                    ],
                                  ) : SizedBox(),
                                  SizedBox(height : 15),
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
                                  SizedBox(height : 10),
                                  Container(
                                      decoration : BoxDecoration(
                                          color : Colors.white,
                                          borderRadius : BorderRadius.circular(5),
                                          border : Border.all(width : 1.5 , color : isPassword ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                      ),
                                      child : TextFormField(
                                          obscureText: !isPasswordVisible,
                                          controller : passController,
                                          validator : (value){
                                            if(value.length == 0){
                                              setState((){
                                                isPassword = false;
                                              });
                                            } else {
                                              setState((){
                                                isPassword = true;
                                              });
                                            }
                                            return null;
                                          },
                                          style : TextStyle(
                                            color : Colors.black,
                                          ),
                                          textAlignVertical : TextAlignVertical.center,
                                          decoration : InputDecoration(
                                              contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                              border : InputBorder.none,
                                              suffixIcon : IconButton(
                                                  onPressed : (){
                                                    setState((){
                                                      isPasswordVisible = !isPasswordVisible;
                                                    });
                                                  },
                                                  icon : Icon(
                                                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                                      size : 25,
                                                      color : Color.fromARGB(255 , 194 , 194 , 194)
                                                  )
                                              )
                                          )
                                      )
                                  ),
                                  SizedBox(height : 5),
                                  !isPassword ?
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "Password is required",
                                          style : TextStyle(
                                              color : Colors.red,
                                              fontSize : 14,
                                              fontFamily : "Times New Roman"
                                          )
                                      )
                                    ],
                                  ) : SizedBox()
                                ],
                              )
                          ),
                          SizedBox(height : 10),
                          Row(
                            mainAxisAlignment : MainAxisAlignment.spaceBetween ,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                      value : checkedValue,
                                      onChanged : (value){
                                        setState((){
                                          checkedValue = value;
                                        });
                                      }
                                  ),
                                  Text("Ingat saya" , style : TextStyle(
                                      color : Colors.black,
                                      fontSize : 14 ,
                                      fontWeight : FontWeight.bold,
                                      fontFamily : "Times New Roman"
                                  ))
                                ],
                              ),
                              Text("Lupa kata sandi?" , style : TextStyle(
                                  color : Colors.black,
                                  fontSize : 14 ,
                                  fontWeight : FontWeight.bold,
                                  fontFamily : "Times New Roman"
                              ))
                            ],
                          ),
                          state is LoginLoading ? Container(
                            child : Center(
                              child : CircularProgressIndicator()
                            )
                          ) : buildLoginButton(loginBloc),
                          SizedBox(height : 20),
                          Row(
                              mainAxisAlignment : MainAxisAlignment.spaceBetween ,
                              children : [
                                Expanded(
                                    child : Container(
                                        margin : EdgeInsets.only(right : 20.0),
                                        height : 2,
                                        color : Color.fromARGB(255 , 194 , 194 , 194)
                                    )
                                ),
                                Text("atau masuk dengan" , style : TextStyle(
                                    color : Color.fromARGB(255 , 194 , 194 , 194),
                                    fontSize : 14,
                                    fontFamily : "Times New Roman"
                                )),
                                Expanded(
                                    child : Container(
                                        margin : EdgeInsets.only(left : 20.0),
                                        height : 2,
                                        color : Color.fromARGB(255 , 194 , 194 , 194)
                                    )
                                )
                              ]
                          ),
                          SizedBox(height : 20),
                          Material(
                              child : InkWell(
                                  onTap : (){

                                  },
                                  child : Container(
                                      width : MediaQuery.of(context).size.width,
                                      height : 50,
                                      decoration : BoxDecoration(
                                          color : Colors.white,
                                          border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61)),
                                          borderRadius : BorderRadius.circular(5)
                                      ),
                                      alignment : Alignment.center,
                                      child : Expanded(
                                          child : Stack(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment : MainAxisAlignment.start,
                                                crossAxisAlignment : CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(width : 15),
                                                  Image.asset("google_icon_logo.png" , width : 25 , height : 20)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment : MainAxisAlignment.center,
                                                crossAxisAlignment : CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text("Google" , style : TextStyle(
                                                      fontFamily : "Times New Roman",
                                                      fontSize : 15 ,
                                                      color : Color.fromARGB(255 , 27 , 42 , 61)
                                                  ))
                                                ],
                                              )
                                            ],
                                          )
                                      )
                                  )
                              )
                          ),
                          SizedBox(height : 50),
                          Row(
                            mainAxisAlignment : MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Belum punya akun IndoIndianshop?" , style : TextStyle(
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
                                  onTap : () async{
                                    var response = await Navigator.push(context , _createRoute());
                                    if(response != null){
                                      if(response["is_register_success"] == true){
                                        successDialog(context ,
                                        "Berhasil Daftar , Silahkan Login");
                                      }
                                    }
                                  },
                                  child : Text("Segera daftar" , style : TextStyle(
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
          );
        }
      )
    );
  }
}