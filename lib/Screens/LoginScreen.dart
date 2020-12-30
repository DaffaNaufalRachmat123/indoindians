import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationEvent.dart';
import 'package:indoindians/Blocs/Login/LoginBloc.dart';
import 'package:indoindians/Blocs/Login/LoginEvent.dart';
import 'package:indoindians/Blocs/Login/LoginState.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
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
  LoginBloc loginBloc;
  Widget buildLoginButton(LoginBloc loginBloc){
    return Material(
        child : InkWell(
            onTap : (){
              loginBloc.add(LoginWithEmailPassword(
                  username : emailController.text.toString(),
                  password : passController.text.toString(),
                  isRemember: checkedValue
              ));
              print("Hello");
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
  @override
  void initState(){
    super.initState();
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    authBloc.add(AppLoaded());
  }
  void getCredentials() async {
    var pref = await SharedPreferences.getInstance();
    String data = pref.getString(Constant.AUTH_PAYLOAD);
    if(data == null){
      print("Null");
    } else {
      print("Ada");
    }
  }
  @override
  Widget build ( BuildContext context ){
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc , LoginState>(
      listener : ( context , state ){
        if(state is LoginFailure){
          print(state.error);
          print("Gagal");
        } else if(state is LoginSuccess){
          print("Berhasil");
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
                              autovalidate : autovalidate,
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
                                          controller : emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          autocorrect: false,
                                          validator : (value){
                                            if(value == null)
                                              return 'Email is required';
                                            else
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
                                          border : Border.all(width : 1.5 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                      ),
                                      child : TextFormField(
                                          controller : passController,
                                          validator : (value){
                                            if(value == null)
                                              return 'Password is required';
                                            else
                                              return null;
                                          },
                                          obscureText: true,
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
                          state == LoginLoading ? CircularProgressIndicator() : buildLoginButton(loginBloc),
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
                                    var response = await Navigator.push(context , MaterialPageRoute(
                                        builder : (BuildContext context) => RegisterScreen()
                                    ));
                                    if(response != null){

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