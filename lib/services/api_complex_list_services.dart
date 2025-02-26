import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:api_practice_codecraft/models/complex_list_model.dart';

class ApiComplexListServices{
  
  Future<List<ComplexListModel>?> getComplexList()async{
    try{
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if(response.statusCode == 200){
        List<ComplexListModel> model = List<ComplexListModel>.from(json.decode(response.body).map((x)=>ComplexListModel.fromJson(x)));
        return model;
      }
    }catch (e){
      print(e.toString());
    }
    return null;
  }
  
}