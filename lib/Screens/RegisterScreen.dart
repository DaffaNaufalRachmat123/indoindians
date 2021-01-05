import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Register/RegisterBloc.dart';
import 'package:indoindians/Blocs/Register/RegisterEvent.dart';
import 'package:indoindians/Blocs/Register/RegisterState.dart';
import 'package:indoindians/Screens/LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build ( BuildContext context ){
    return BlocProvider(
      create : ( context ) => RegisterBloc(RegisterInitial()),
      child : Register()
    );
  }
}

class Register extends StatefulWidget {
  @override
  RegisterScreenState createState () => RegisterScreenState();
}

class RegisterScreenState extends State<Register> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final eController = TextEditingController();
  final fController = TextEditingController();
  final lController = TextEditingController();
  final pController = TextEditingController();

  bool isEmail = true;
  bool isFName = true;
  bool isLName = true;
  bool isPassword = true;
  bool isPasswordVisible = false;
  @override
  void dispose(){
    eController.dispose();
    fController.dispose();
    lController.dispose();
    pController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    eController.addListener((){
      if(eController.text.length > 0){
        setState((){
          isEmail = true;
        });
      } else {
        setState((){
          isEmail = false;
        });
      }
    });
    fController.addListener((){
      if(fController.text.length > 0){
        setState((){
          isFName = true;
        });
      } else {
        setState((){
          isFName = false;
        });
      }
    });
    lController.addListener((){
      if(lController.text.length > 0){
        setState((){
          isLName = true;
        });
      } else {
        setState((){
          isLName = false;
        });
      }
    });
    pController.addListener((){
      if(pController.text.length > 0){
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
  @override
  Widget build ( BuildContext context ){
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocListener<RegisterBloc , RegisterState>(
      listener : ( context , state ) {
        if(state is RegisterSuccess){
          Map response = {
            "is_register_success" : true
          };
          Navigator.pop(context , response);
        } else if(state is RegisterFailure){
          print(state.error);
        }
      },
      child : BlocBuilder<RegisterBloc , RegisterState>(
        builder : ( context , state ){
          return Scaffold(
              body : SafeArea(
                  child : Container(
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
                                                  border : Border.all(width : 1.5 , color : isEmail ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                              ),
                                              child : TextFormField(
                                                keyboardType: TextInputType.emailAddress,
                                                  style : TextStyle(
                                                    color : Colors.black,
                                                  ),
                                                  controller : eController,
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
                                                  border : Border.all(width : 1.5 , color : isFName ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                              ),
                                              child : TextFormField(
                                                  style : TextStyle(
                                                    color : Colors.black,
                                                  ),
                                                  controller : fController,
                                                  validator : (value){
                                                    if(value.length == 0){
                                                      setState((){
                                                        isFName = false;
                                                      });
                                                    } else {
                                                      setState((){
                                                        isFName = true;
                                                      });
                                                    }
                                                    return null;
                                                  },
                                                  textAlignVertical : TextAlignVertical.center,
                                                  decoration : InputDecoration(
                                                      contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                                      border : InputBorder.none,
                                                      suffixIcon : Icon(
                                                          Icons.person,
                                                          size : 25,
                                                          color : Color.fromARGB(255 , 194 , 194 , 194)
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height : 5),
                                          !isFName ?
                                          Row(
                                            mainAxisAlignment : MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  "First Name is required",
                                                  style : TextStyle(
                                                      color : Colors.red,
                                                      fontSize : 14,
                                                      fontFamily : "Times New Roman"
                                                  )
                                              )
                                            ],
                                          ) : SizedBox(),
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
                                                  border : Border.all(width : 1.5 , color : isLName ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                              ),
                                              child : TextFormField(
                                                  style : TextStyle(
                                                    color : Colors.black,
                                                  ),
                                                  controller : lController,
                                                  validator : (value){
                                                    if(value.length == 0){
                                                      setState((){
                                                        isLName = false;
                                                      });
                                                    } else {
                                                      setState((){
                                                        isLName = true;
                                                      });
                                                    }
                                                    return null;
                                                  },
                                                  textAlignVertical : TextAlignVertical.center,
                                                  decoration : InputDecoration(
                                                      contentPadding : EdgeInsets.only(left : 15 , right : 15),
                                                      border : InputBorder.none,
                                                      suffixIcon : Icon(
                                                          Icons.person,
                                                          size : 25,
                                                          color : Color.fromARGB(255 , 194 , 194 , 194)
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height : 5),
                                          !isLName ?
                                          Row(
                                            mainAxisAlignment : MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  "Last Name is required",
                                                  style : TextStyle(
                                                      color : Colors.red,
                                                      fontSize : 14,
                                                      fontFamily : "Times New Roman"
                                                  )
                                              )
                                            ],
                                          ): SizedBox(),
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
                                                  border : Border.all(width : 1.5 , color : isPassword ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                              ),
                                              child : TextFormField(
                                                  style : TextStyle(
                                                    color : Colors.black,
                                                  ),
                                                  obscureText: !isPasswordVisible,
                                                  controller : pController,
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
                                                    /*suffixIcon : Icon(
                                                Icons.lock,
                                                size : 25,
                                                color : Color.fromARGB(255 , 194 , 194 , 194)
                                            )*/
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
                                  SizedBox(height : 15),
                                  state is RegisterLoading ? Container(
                                    width : MediaQuery.of(context).size.width,
                                    child : Center(
                                      child : CircularProgressIndicator()
                                    )
                                  ) : Material(
                                      child : InkWell(
                                          onTap : (){
                                            if(isEmail && isFName && isLName && isPassword){
                                              var payload = CustomerModel(
                                                customer : Customer(
                                                  email : eController.text.toString(),
                                                  firstname : fController.text.toString(),
                                                  lastname : lController.text.toString()
                                                ),
                                                username : eController.text.toString(),
                                                password : pController.text.toString()
                                              );
                                              registerBloc.add(RegisterWithData(model : payload));
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
              )
          );
        }
      )
    );
  }
}