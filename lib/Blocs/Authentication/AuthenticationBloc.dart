import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Models/User.dart';
import 'package:indoindians/Blocs/Services/GeneralService.dart';
import 'package:indoindians/Configs/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthenticationEvent.dart';
import 'AuthenticationState.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent , AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if(event is AppLoaded){
      yield* mapAppLoadedToState(event);
    }
    if(event is UserLoggedIn){
      yield* mapUserLoggedInState(event);
    }
    if(event is UserLoggedOut){
      yield* mapUserLoggedOutToState(event);
    }
  }
  Stream<AuthenticationState> mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    print("test");
    try {
      var pref = await SharedPreferences.getInstance();
      String payload = pref.getString(Constant.AUTH_PAYLOAD);
      print(payload);
      if(payload != null){
        var data = json.decode(payload);
        var user = new User(
          id : data["id"] ,
          group_id : data["group_id"],
          created_at : data["created_at"],
          updated_at : data["updated_at"],
          created_in : data["created_in"],
          email : data["email"],
          firstname : data["firstname"],
          lastname : data["lastname"],
          store_id : data["store_id"],
          website_id : data["website_id"],
          disable_auto_group_change: data["disable_auto_group_change"],
          token : data["token"]
        );
        print("Udah ada bangsat");
        yield AuthenticationAuthenticated(user : user);
      } else {
        print("Belom login cak");
        yield AuthenticationFailure(message : 'Username atau Password salah');
      }
    } catch (e) {
      print("Masuk Sini : " + e.toString());
      yield AuthenticationFailure(message : 'Theres an error when load credentials');
    }
  }
  Stream<AuthenticationState> mapUserLoggedInState(UserLoggedIn event) async* {
    var pref = await SharedPreferences.getInstance();
    pref.setString(Constant.AUTH_PAYLOAD , json.encode(event.user.toJsonSave()));
    pref.commit();
    yield AuthenticationAuthenticated(user : event.user);
  }
  Stream<AuthenticationState> mapUserLoggedOutToState(UserLoggedOut event) async* {
    yield AuthenticationNotAuthenticated();
  }
}