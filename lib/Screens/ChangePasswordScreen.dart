import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/ChnagePwd/ChangePwdBloc.dart';
import 'package:indoindians/Blocs/ChnagePwd/ChangePwdEvent.dart';
import 'package:indoindians/Blocs/ChnagePwd/ChangePwdState.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : ( context ) => ChangePwdBloc(),
      child : ChangePassword()
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  ChnagePasswordState createState () => ChnagePasswordState();
}

class ChnagePasswordState extends State<ChangePassword> {
  bool isPw1 = false;
  bool isPw2 = false;
  bool isOldPw = true;
  bool isNewPw = true;
  final oldController = TextEditingController();
  final newController = TextEditingController();
  @override
  void dispose(){
    oldController.dispose();
    newController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    oldController.addListener((){
      if(oldController.text.length > 0){
        setState((){
          isOldPw = true;
        });
      } else {
        setState((){
          isOldPw = false;
        });
      }
    });
    newController.addListener((){
      if(newController.text.length > 0){
        setState((){
          isNewPw = true;
        });
      } else {
        setState((){
          isNewPw = false;
        });
      }
    });
    super.initState();
  }
  @override
  Widget build ( BuildContext context ){
    final changeBloc = BlocProvider.of<ChangePwdBloc>(context);
    return BlocListener<ChangePwdBloc , ChangePwdState>(
      listener : ( context , state ){
        if(state is ChangePwdSuccess){
          Map response = {
            "is_change_success" : true
          };
          Navigator.pop(context , response);
        } else if(state is ChangePwdFailure){
          errorDialog(context,
          state.error);
        }
      },
      child : BlocBuilder<ChangePwdBloc , ChangePwdState>(
        builder : ( context , state ){
          return Scaffold(
            body : Container(
                margin : EdgeInsets.symmetric(horizontal : 40.0),
                child : Center(
                    child : SingleChildScrollView(
                        child : Container(
                            child : Column(
                              mainAxisSize : MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment : MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Change Password" , style : TextStyle(
                                      color : Color.fromARGB(255 , 30 , 42 , 56),
                                      fontWeight : FontWeight.bold,
                                      fontFamily : "Times New Roman",
                                      fontSize : 20,
                                    ))
                                  ],
                                ),
                                SizedBox(height : 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Old Password" , style : TextStyle(
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
                                        border : Border.all(width : 1.5 , color : isOldPw ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                    ),
                                    child : TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        obscureText: !isPw1,
                                        controller : oldController,
                                        validator : (value){
                                          if(value.length == 0){
                                            setState((){
                                              isOldPw = false;
                                            });
                                          } else {
                                            setState((){
                                              isOldPw = true;
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
                                                    isPw1 = !isPw1;
                                                  });
                                                },
                                                icon : Icon(
                                                    isPw1 ? Icons.visibility : Icons.visibility_off,
                                                    size : 25,
                                                    color : Color.fromARGB(255 , 194 , 194 , 194)
                                                )
                                            )
                                        )
                                    )
                                ),
                                SizedBox(height : 5),
                                !isOldPw ?
                                Row(
                                  mainAxisAlignment : MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "Old Password is required",
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
                                    Text("New Password" , style : TextStyle(
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
                                        border : Border.all(width : 1.5 , color : isNewPw ? Color.fromARGB(255 , 27 , 42 , 61) : Colors.red)
                                    ),
                                    child : TextFormField(
                                        obscureText: !isPw2,
                                        controller : newController,
                                        validator : (value){
                                          if(value.length == 0){
                                            setState((){
                                              isNewPw = false;
                                            });
                                          } else {
                                            setState((){
                                              isNewPw = true;
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
                                                    isPw2 = !isPw2;
                                                  });
                                                },
                                                icon : Icon(
                                                    isPw2 ? Icons.visibility : Icons.visibility_off,
                                                    size : 25,
                                                    color : Color.fromARGB(255 , 194 , 194 , 194)
                                                )
                                            )
                                        )
                                    )
                                ),
                                SizedBox(height : 5),
                                !isNewPw ?
                                Row(
                                  mainAxisAlignment : MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "New Password is required",
                                        style : TextStyle(
                                            color : Colors.red,
                                            fontSize : 14,
                                            fontFamily : "Times New Roman"
                                        )
                                    )
                                  ],
                                ) : SizedBox(),
                                SizedBox(height : 20),
                                Material(
                                    child : InkWell(
                                        onTap : (){
                                          if(isOldPw && isNewPw){
                                            changeBloc.add(ChangePwdData(
                                              curPassword: oldController.text.toString(),
                                              newPassword: newController.text.toString()
                                            ));
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
                                            child : Text("Submit" , style : TextStyle(
                                                color : Colors.white,
                                                fontSize : 15 ,
                                                fontFamily : "Times New Roman"
                                            ))
                                        )
                                    )
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