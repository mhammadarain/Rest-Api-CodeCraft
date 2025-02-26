import 'dart:convert';
import 'package:api_practice_codecraft/models/user_data_model.dart';
import 'package:http/http.dart'as http;

class ApiUserDataServices{
  
  
  Future<List<UserDataModel>?> getUserDataPost()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if(response.statusCode == 200){
        List<UserDataModel> model = List<UserDataModel>.from(json.decode(response.body).map((x)=> UserDataModel.fromJson(x)));
        return model;
      }
      
    }catch (e){
      print(e.toString());
    }return null;
  }
  
}