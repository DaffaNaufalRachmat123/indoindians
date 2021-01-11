import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Models/User.dart';
import 'package:indoindians/Blocs/Profile/ProfileEvent.dart';
import 'package:indoindians/Blocs/Profile/ProfileState.dart';
import 'package:indoindians/Blocs/Services/AuthService.dart';

class ProfileBloc extends Bloc<ProfileEvent , ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState);
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is GetProfile){
      yield* getProfileData(event);
    }
  }
  Stream<ProfileState> getProfileData(GetProfile event) async* {
    yield ProfileLoading();
    try {
      AuthService service = new AuthService();
      var response = await service.getProfile(event.token);
      if(response['is_success'] == true){
        var user = User.fromJson(response['data']);
        yield ProfileSuccess(user : user);
      } else {
        print('Error nya ke sini woy');
        yield ProfileError(error : response['data']['message']);
      }
    } catch (e){
      print(e);
      yield ProfileError(error : 'SOmething wronpps');
    }
  }
}