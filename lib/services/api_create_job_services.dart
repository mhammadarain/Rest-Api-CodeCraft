import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:api_practice_codecraft/models/create_job_model.dart';

class ApiCreateJobServices{

  Future<CreateJobModel?> createJob(String name, String job)async{
    try{
      var url = Uri.parse("https://reqres.in/api/users");
      var response = await http.post(url, body: {
        "name": name,
        "job": job
      });

      if(response.statusCode == 201){

        CreateJobModel model = CreateJobModel.fromJson(jsonDecode(response.body));
        return model;
      }
      
      
    }catch (e){
      print(e.toString());
    }
  }

}