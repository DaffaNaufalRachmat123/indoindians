import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginWithEmailPassword extends LoginEvent {
  final String username;
  final String password;
  final bool isRemember;
  LoginWithEmailPassword({@required this.username , @required this.password , @required this.isRemember});
  @override
  List<Object> get props => [ username , password ,isRemember ];
}

class LogoutAccount extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginForgot extends LoginEvent {
  final String email;
  LoginForgot({@required this.email});
  @override
  List<Object> get props => [];
}