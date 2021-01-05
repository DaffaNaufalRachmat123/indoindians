import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class Logout extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure({@required this.error});
  @override
  List<Object> get props => [ error ];
}

class ForgotLoading extends LoginState {}
class ForgotSuccess extends LoginState {}
class ForgotFailure extends LoginState {
  final String error;
  ForgotFailure({@required this.error});
  @override
  List<Object> get props => [ error ];
}