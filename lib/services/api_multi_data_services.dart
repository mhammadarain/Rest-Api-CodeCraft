import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:api_practice_codecraft/models/multi_data_model.dart';


class ApiMuiltDataServices{

  Future<MultiDataModel?> getMultiDataWithModel() async{
    try{
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if(response.statusCode == 200){
        MultiDataModel model = MultiDataModel.fromJson(json.decode(response.body));
        return model;
      }
    }catch (e){
      print(e.toString());
    }
    return null;
  }


}