import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:indoindians/Blocs/Register/RegisterEvent.dart';
import 'package:indoindians/Blocs/Register/RegisterState.dart';
import 'package:indoindians/Blocs/Services/GeneralService.dart';

class RegisterBloc extends Bloc<RegisterEvent , RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState);
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is RegisterWithData){
      yield* registerWithData(event);
    }
  }
  Stream<RegisterState> registerWithData(RegisterWithData event) async* {
    yield RegisterLoading();
    try {
      GeneralService auth = new GeneralService();
      var payload = CustomerModel(
          customer : Customer(
              email : event.model.customer.email,
              firstname : event.model.customer.firstname,
              lastname : event.model.customer.lastname
          ),
          username : event.model.username,
          password : event.model.password
      );
      final response = await auth.registerCustomer(payload);
      if(response['is_success'] == true){
        yield RegisterSuccess();
        yield RegisterInitial();
      } else {
        yield RegisterFailure(error : response['data']['message']);
      }
    } catch (e) {
      print(e);
      yield RegisterFailure(error : 'Error');
    }
  }
}