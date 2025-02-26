import 'dart:convert';
import 'package:api_practice_codecraft/models/single_Post_model.dart';
import 'package:http/http.dart'as http;

import '../models/list_post_model.dart';

class ApiSinglePostServices{

  //with Model
  Future<SinglePostWithModel?> getSinglePostWithModel()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if(response.statusCode == 200){
        SinglePostWithModel model = SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      }
    }catch (e){
      print(e.toString());
    }return null;
  }

  //Without Model
  Future<dynamic> getSinglePostWithoutModel()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      if(response.statusCode == 200){
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      }

    }catch (e){
      print(e.toString());
    }return null;

  }


}