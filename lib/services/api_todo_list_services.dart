import 'dart:convert';
import 'package:api_practice_codecraft/models/to_do_list_model.dart';
import 'package:http/http.dart'as http;

class ApiToDoListServices{

  Future<List<ToDoListModel>?> getToDoList()async{
    try{
      var response = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      if(response.statusCode == 200){
        List<ToDoListModel> model = List<ToDoListModel>.from(json.decode(response.body).map((x)=> ToDoListModel.fromJson(x)));
        return model;
      }
    }catch (e){
      print(e.toString());
    }return null;
  }


}