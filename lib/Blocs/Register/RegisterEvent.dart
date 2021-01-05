import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterWithData extends RegisterEvent {
  final CustomerModel model;
  RegisterWithData({@required this.model});
  @override
  List<Object> get props => [ model ];
}