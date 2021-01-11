import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetProfile extends ProfileEvent {
  final String token;
  GetProfile({@required this.token});
  @override
  List<Object> get props => [ token ];
}