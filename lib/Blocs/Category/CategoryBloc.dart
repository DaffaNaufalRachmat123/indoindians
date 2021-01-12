import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Category/CategoryEvent.dart';
import 'package:indoindians/Blocs/Category/CategoryState.dart';
import 'package:indoindians/Blocs/Models/Category.dart';
import 'package:indoindians/Blocs/Services/GeneralService.dart';

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
      GeneralService service = new GeneralService();
      var response = await service.getCategoryList(event.token , event.depth , event.root_category_id);
      print(response['is_success'].toString());
      if(response['is_success'] == true){
        List<SubCategory> list1 = new List<SubCategory>();
        var data = response['data'];
        var data1 = data['children_data'];
        for(int i = 0; i < data1[0]['children_data'].length; i++){
          List<SubCategory> list2 = new List<SubCategory>();
          var final_data1 = data1[0]['children_data'][i];
          var data2 = data1[0]['children_data'][i];
          for(int j = 0; j < data2.length; j++){
            var final_data2 = data2[j];
            list2.add(SubCategory(
                id : final_data2['id'] as int,
                parent_id : final_data2['parent_id'] as int,
                name : final_data2['name'] as String,
                is_active : final_data2['is_active'] as bool,
                position : final_data2['position'] as int,
                level : final_data2['level'] as int,
                product_count: final_data2['product_count'] as int,
                children_data: null
            ));
          }
          list1.add(SubCategory(
              id : final_data1['id'] as int,
              parent_id : final_data1['parent_id'] as int,
              name : final_data1['name'] as String,
              is_active : final_data1['is_active'] as bool,
              position : final_data1['position'] as int,
              level : final_data1['level'] as int,
              product_count: final_data1['product_count'] as int,
              children_data: list2
          ));
        }
        var category = Category(
          id : data['id'] as int,
          parent_id : data['parent_id'] as int,
          name : data['name'] as String,
          is_active : data['is_active'] as bool,
          position : data['position'] as int,
          level : data['level'] as int,
          product_count: data['product_count'] as int,
          children_data: list1
        );
        yield CategorySuccess(category : category);
      } else {
        print("masuk sini bos");
        yield CategoryError(error : 'Error when fetching data from API');
      }
    } catch (e){
      print(e);
      yield CategoryError(error : 'Something wrong in this apps');
    }
  }
}