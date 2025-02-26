
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:api_practice_codecraft/models/logn_model.dart';

class ApiLoginServices{
  
  
  Future<LoginModel?> loginWithModel(String email, String password)async{
    try{
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url,body: {
        "email": email,
        "password": password
      });
      if(response.statusCode == 200){
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    }catch (e){
      print(e.toString());
    }
  }



  Future<dynamic> loginWithoutModel(String email, String password)async{
    try{
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url,body: {
        "email": email,
        "password": password
      });
      if(response.statusCode == 200){
        final model = jsonDecode(response.body);
        return model;
      }
    }catch (e){
      print(e.toString());
    }
  }
}