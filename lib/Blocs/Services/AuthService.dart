import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:indoindians/Blocs/Models/ChangePwd.dart';
import 'package:indoindians/Blocs/Models/CustomerModel.dart';
import '../../Configs/UriConfig.dart';

class AuthService {
  Dio dio = new Dio();
  Future registerCustomer(CustomerModel customerModel) async {
    print("Data : " + customerModel.toJsonRegister().toString());
    var response = await dio.post(UriConfig.getOldUrl() + "/rest/default/V1/customers" , data : json.encode(customerModel.toJsonRegister()) , options : Options(
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
      return {
        "is_success" : true,
        "data" : response.data
      };
    } else {
      return {
        "is_success" : false,
        "data" : response.data
      };
    }
  }
  Future loginCustomer(CustomerModel model) async {
    var response = await dio.post(UriConfig.getOldUrl() + "/rest/default/V1/integration/customer/token" , data : model.toJsonLogin() , options : Options(
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
      return {
        "is_success" : true,
        "data" : response.data
      };
    } else {
      return {
        "is_success" : false,
        "data" : response.data
      };
    }
  }
  Future changePassword(ChangePwd model , String token) async {
    print(token);
    var response = await dio.put(UriConfig.getOldUrl() + "/rest/default/V1/customers/me/password" , data : json.encode(model.toJsonChange()) , options : Options(
      headers : {
        "Content-Type" : "application/json",
        "Authorization" : token
      },
      followRedirects: false,
      validateStatus : (status){
        return status <= 500;
      }
    ));
    print(response);
    print(response.statusCode);
    if(response.statusCode == 200){
      return {
        "is_success" : true,
        "data" : response.data
      };
    } else {
      return {
        "is_success" : false,
        "data" : response.data
      };
    }
  }
}