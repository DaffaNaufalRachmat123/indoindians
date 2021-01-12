import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationEvent.dart';
import 'package:indoindians/Blocs/Models/ChangePwd.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Models/User.dart';
import 'package:indoindians/Blocs/Services/GeneralService.dart';
import 'package:indoindians/Configs/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ChangePwdEvent.dart';
import 'ChangePwdState.dart';

class ChangePwdBloc extends Bloc<ChangePwdEvent , ChangePwdState> {
  ChangePwdBloc():
      super(ChangePwdInitial());
  @override
  Stream<ChangePwdState> mapEventToState(ChangePwdEvent event) async* {
    if(event is ChangePwdData){
      yield* changePassword(event);
    }
  }
  Stream<ChangePwdState> changePassword(ChangePwdData event) async* {
    yield ChangePwdLoading();
    try {
      GeneralService authService = new GeneralService();
      var payload = ChangePwd(
        curPassword: event.curPassword,
        newPassword: event.newPassword
      );
      var pref = await SharedPreferences.getInstance();
      String data = pref.getString(Constant.AUTH_PAYLOAD);
      var decoded = json.decode(data);
      var token = decoded['token'];
      final response = await authService.changePassword(payload , token);
      if(response['is_success'] == true){

        yield ChangePwdSuccess();
        yield ChangePwdInitial();
      } else {
        yield ChangePwdFailure(error : response['data']['message']);
      }
    } catch (e) {
      print(e);
      yield ChangePwdFailure(error : 'Error in apps');
    }
  }
}