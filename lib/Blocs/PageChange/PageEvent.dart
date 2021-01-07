import 'package:indoindians/Blocs/Models/ChangePage.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class PageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PageChange extends PageEvent {
   final int index;
   PageChange({@required this.index});
   @override
   List<Object> get props => [ index ];
}