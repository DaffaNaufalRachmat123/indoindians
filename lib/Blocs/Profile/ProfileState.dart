import 'package:indoindians/Blocs/Models/User.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  final User user;
  ProfileSuccess({@required this.user});
  @override
  List<Object> get props => [ user ];
}
class ProfileError extends ProfileState {
  final String error;
  ProfileError({@required this.error});
  @override
  List<Object> get props => [ error ];
}