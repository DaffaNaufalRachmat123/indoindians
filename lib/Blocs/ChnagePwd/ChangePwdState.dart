import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ChangePwdState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePwdInitial extends ChangePwdState {}
class ChangePwdLoading extends ChangePwdState {}
class ChangePwdSuccess extends ChangePwdState {}
class ChangePwdFailure extends ChangePwdState {
  final String error;
  ChangePwdFailure({@required this.error});
  @override
  List<Object> get props => [ error ];
}