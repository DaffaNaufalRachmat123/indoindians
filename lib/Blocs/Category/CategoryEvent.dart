import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetCategoryList extends CategoryEvent {
  final String token;
  final int depth;
  final int root_category_id;
  GetCategoryList({@required this.token , @required this.depth , @required this.root_category_id});
  @override
  List<Object> get props => [ token , depth , root_category_id ];
}