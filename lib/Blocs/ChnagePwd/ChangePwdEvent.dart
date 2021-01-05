import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ChangePwdEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePwdData extends ChangePwdEvent {
  final String curPassword;
  final String newPassword;
  ChangePwdData({@required this.curPassword , @required this.newPassword });
  @override
  List<Object> get props => [ curPassword , newPassword ];
}

class LogoutAccount extends ChangePwdEvent {
  @override
  List<Object> get props => [];
}