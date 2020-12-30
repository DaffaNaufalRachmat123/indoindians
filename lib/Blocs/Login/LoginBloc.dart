import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationBloc.dart';
import 'package:indoindians/Blocs/Authentication/AuthenticationEvent.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Models/User.dart';
import 'package:indoindians/Blocs/Services/AuthService.dart';
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
    }
  }
  Stream<LoginState> mapLoginWithEmailPassword(LoginWithEmailPassword event) async* {
    yield LoginLoading();
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
    if(response != null){
      var user = new User(
          id : 0 ,
          group_id : 0,
          created_at : "",
          updated_at : "",
          created_in : "",
          email : payload.customer.email,
          firstname : payload.customer.firstname,
          lastname : payload.customer.lastname,
          store_id : 0,
          website_id : 0,
          disable_auto_group_change: 0,
          token : response.toString()
      );
      yield LoginSuccess();
      yield LoginInitial();
      authenticationBloc.add(UserLoggedIn(user : user , isRemember: event.isRemember));
    } else {
      yield LoginFailure(error : 'Username atau Password salah');
    }
  }
}