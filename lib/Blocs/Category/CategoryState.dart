import 'package:indoindians/Blocs/Models/Category.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}
class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
  final Category category;
  CategorySuccess({@required this.category});
  @override
  List<Object> get props => [ category ];
}
class CategoryError extends CategoryState {
  final String error;
  CategoryError({@required this.error});
  @override
  List<Object> get props => [ error ];
}