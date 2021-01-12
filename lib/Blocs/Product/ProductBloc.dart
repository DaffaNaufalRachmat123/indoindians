import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:indoindians/Blocs/Models/Product.dart';
import 'package:indoindians/Blocs/Product/ProductEvent.dart';
import 'package:indoindians/Blocs/Product/ProductState.dart';
import 'package:indoindians/Blocs/Services/GeneralService.dart';
import 'package:indoindians/Configs/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductBloc extends Bloc<ProductEvent , ProductState> {
  ProductBloc(ProductState initState) : super(initState);
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if(event is GetProductDetails){
      yield* getProductDetails(event);
    }
  }
  Stream<ProductState> getProductDetails(GetProductDetails event) async* {
    yield ProductLoading();
    try {
      GeneralService service = new GeneralService();
      var pref = await SharedPreferences.getInstance();
      String payload = pref.getString(Constant.AUTH_PAYLOAD);
      var decoded = json.decode(payload);
      var response = await service.getProductDetails(decoded['token'] as String , event.name);
      if(response['is_success'] == true){
        var product = Product.fromJson(response['data']);
        yield ProductSuccess(product : product);
      } else {
        yield ProductError(error : 'Error when fetching data');
      }
    } catch (err) {
      yield ProductError(error : 'Something wrong in this apps');
    }
  }
}