import 'dart:async';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import '../../Configs/UriConfig.dart';

class AuthService {
  Dio dio = new Dio();
  Future registerCustomer(CustomerModel customerModel) async {
    var response = await dio.post(UriConfig.getUrl() + "/rest/default/V1/customers" , data : customerModel.toJsonRegister() , options : Options(
      headers : {
        "Content-Type" : "application/json"
      },
      followRedirects : false,
      validateStatus : (status) {
        return status <= 500;
      }
    ));
    print(response);
    if(response.statusCode == 200){
      return response.data;
    } else {
      return null;
    }
  }
  Future loginCustomer(CustomerModel model) async {
    var response = await dio.post(UriConfig.getUrl() + "/rest/default/V1/integration/customer/token" , data : model.toJsonLogin() , options : Options(
      headers : {
        "Content-Type" : "application/json"
      },
      followRedirects : false,
      validateStatus : (status){
        return status <= 500;
      }
    ));
    print(response);
    if(response.statusCode == 200){
      return response.data;
    } else {
      return null;
    }
  }
}