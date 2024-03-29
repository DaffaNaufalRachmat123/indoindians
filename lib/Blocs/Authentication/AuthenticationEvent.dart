import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../Models/User.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {
  final User user;
  final bool isRemember;
  UserLoggedIn({@required this.user , @required this.isRemember});
  @override
  List<Object> get props => [ user , isRemember ];
}

class RegisteredLoggedIn extends AuthenticationEvent {
  final User user;
  RegisteredLoggedIn({@required this.user});
  @override
  List<Object> get props => [ user ];
}

class UserLoggedOut extends AuthenticationEvent {}