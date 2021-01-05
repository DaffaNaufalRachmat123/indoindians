import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationEvent.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Models/User.dart';
import 'package:indoindians/Blocs/Services/AuthService.dart';
import 'package:indoindians/Configs/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent , LoginState> {
  final AuthenticationBloc authenticationBloc;
  final CustomerModel model;
  LoginBloc(AuthenticationBloc authenticationBloc , CustomerModel model):
      assert(authenticationBloc != null),
      assert(model != null),
      this.authenticationBloc = authenticationBloc,
      this.model = model,
      super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginWithEmailPassword){
      yield* mapLoginWithEmailPassword(event);
    } else if(event is LogoutAccount){
      yield* logoutState(event);
    }
  }
  Stream<LoginState> logoutState(LogoutAccount state) async* {
    var pref = await SharedPreferences.getInstance();
    pref.remove(Constant.AUTH_PAYLOAD);
    pref.commit();
    yield Logout();
  }
  Stream<LoginState> mapLoginWithEmailPassword(LoginWithEmailPassword event) async* {
    yield LoginLoading();
    try {
      AuthService authService = new AuthService();
      var payload = CustomerModel(
          customer : Customer(
              email : '',
              firstname: '',
              lastname: ''
          ),
          username : event.username,
          password: event.password
      );
      final response = await authService.loginCustomer(payload);
      if(response['is_success'] == true){
        var user = new User(
            id : 0 ,
            group_id : 0,
            created_at : "kosong",
            updated_at : "kosong",
            created_in : "kosong",
            email : payload.username,
            firstname : "kosong",
            lastname : "kosong",
            store_id : 0,
            website_id : 0,
            disable_auto_group_change: 0,
            token : "Bearer " + response['data'].toString(),
            isRemember: event.isRemember
        );
        yield LoginSuccess();
        yield LoginInitial();
        authenticationBloc.add(UserLoggedIn(user : user , isRemember: event.isRemember));
      } else {
        yield LoginFailure(error : response['data']['message']);
      }
    } catch (e) {
      print(e);
      yield LoginFailure(error : 'Error in apps');
    }
  }
}