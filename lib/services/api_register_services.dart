
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:api_practice_codecraft/models/register_model.dart';

class ApiRegisterServices{
  
  
  Future<RegisterModel?> register(String email, String password)async{
    try{
      var url = Uri.parse("https://reqres.in/api/register");
      
      var response = await http.post(url, body: {
        "email": "eve.holt@reqres.in",
        "password": "pistol"
      });


      if(response.statusCode == 200){
        RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
        return model;
      }
    }catch (e){
      print(e.toString());
    }
  }
}