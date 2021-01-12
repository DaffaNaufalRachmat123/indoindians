import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductDetails extends ProductEvent {
  final String name;
  GetProductDetails({@required this.name});
  @override
  List<Object> get props => [ name ];
}