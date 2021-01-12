import 'package:indoindians/Blocs/Models/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final Product product;
  ProductSuccess({@required this.product});
  @override
  List<Object> get props => [ product ];
}
class ProductError extends ProductState {
  final String error;
  ProductError({@required this.error});
  @override
  List<Object> get props => [ error ];
}