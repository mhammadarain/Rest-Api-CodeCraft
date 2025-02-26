import 'dart:convert';
import '../models/list_post_model.dart';
import 'package:http/http.dart'as http;

class ApiListPostServices{

  //List Post with Model
  Future<List<ListPostWithModel>?> getListPost()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode == 200){
        List<ListPostWithModel> model = List<ListPostWithModel>.from(json.decode(response.body).map((x)=> ListPostWithModel.fromJson(x)));
        return model;
      }
    }catch (e){
      print(e.toString());
    }return null;
  }

  
  //List Post without Model
  Future<dynamic> getPostWithOutModel()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode == 200){
        final model = jsonDecode(response.body);
        return model;
      }
    }catch (e){
      print(e.toString());
    }return null;
  }
}