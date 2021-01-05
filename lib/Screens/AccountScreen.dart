import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Login/LoginBloc.dart';
import 'package:indoindians/Blocs/Login/LoginEvent.dart';
import 'package:indoindians/Blocs/Login/LoginState.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Screens/ChangePasswordScreen.dart';
import 'package:indoindians/Screens/LoginScreen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build ( BuildContext context ){
    return MultiBlocProvider(
        providers : [
          BlocProvider<LoginBloc>(
              create : ( context ) => LoginBloc(AuthenticationBloc() , CustomerModel())
          ),
        ],
        child : Account()
    );
  }
}

class Account extends StatefulWidget {
  @override
  AccountState createState () => AccountState();
}

class AccountState extends State<Account> {
  LoginBloc loginBloc;
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
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc , LoginState> (
      listener : ( context , state ){
        if(state is Logout){
          Navigator.pushAndRemoveUntil(context , MaterialPageRoute(
            builder : ( context ) => LoginScreen()
          ) , (route) => false);
        }
      },
      child : BlocBuilder<LoginBloc , LoginState>(
        builder : ( context , state ){
          return Scaffold(
            body : Center(
              child : Container(
                child : Column(
                  mainAxisSize : MainAxisSize.min,
                  children : [
                    Material(
                        child : InkWell(
                            onTap : () async {
                              var response = await Navigator.push(context , _createRouteChangePasswordScreen());
                              if(response != null){
                                if(response["is_change_success"] == true){
                                  successDialog(context ,
                                      "Berhasil Ubah Password");
                                }
                              }
                            },
                            child : Container(
                                width : MediaQuery.of(context).size.width,
                                margin : EdgeInsets.symmetric(horizontal : 50.0),
                                height : 50,
                                decoration : BoxDecoration(
                                    borderRadius : BorderRadius.circular(10),
                                    border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                ),
                                alignment : Alignment.center,
                                child : Text("Change Password" , style : TextStyle(
                                    color : Color.fromARGB(255, 27, 42, 61),
                                    fontSize : 15 ,
                                    fontFamily : "Times New Roman"
                                ))
                            )
                        )
                    ),
                    SizedBox(height : 30),
                    Material(
                        child : InkWell(
                            onTap : (){
                              loginBloc.add(LogoutAccount());
                            },
                            child : Container(
                                width : MediaQuery.of(context).size.width,
                                margin : EdgeInsets.symmetric(horizontal : 50.0),
                                height : 50,
                                decoration : BoxDecoration(
                                    borderRadius : BorderRadius.circular(10),
                                    color : Color.fromARGB(255 , 27 , 42 , 61)
                                ),
                                alignment : Alignment.center,
                                child : Text("Keluar" , style : TextStyle(
                                    color : Colors.white,
                                    fontSize : 15 ,
                                    fontFamily : "Times New Roman"
                                ))
                            )
                        )
                    )
                  ]
                )
              )
            )
          );
        }
      )
    );
  }
}