import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Category/CategoryEvent.dart';
import 'package:indoindians/Blocs/Category/CategoryState.dart';
import 'package:indoindians/Blocs/Models/Category.dart';
import 'package:indoindians/Blocs/Services/AuthService.dart';

class CategoryBloc extends Bloc<CategoryEvent , CategoryState> {
  CategoryBloc(CategoryState initState) : super(initState);
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if(event is GetCategoryList){
      yield* getCategoryList(event);
    }
  }
  Stream<CategoryState> getCategoryList(GetCategoryList event) async* {
    yield CategoryLoading();
    try {
      AuthService service = new AuthService();
      var response = await service.getCategoryList(event.token , event.depth , event.root_category_id);
      if(response['is_success'] == true){
        var categories = Category.fromJson(response['data']);
        yield CategorySuccess(category : categories);
      } else {
        yield CategoryError(error : 'Error when fetching data from API');
      }
    } catch (e){
      yield CategoryError(error : 'Something wrong in this apps');
    }
  }
}