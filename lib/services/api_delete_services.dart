

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../models/put_patch_model.dart';

class ApiDeleteServices{
  Future<bool?> deleteJob(String user) async {
    try {
      var response = await http.delete(
        Uri.parse("https://reqres.in/api/users/$user"),
      );

      if (response.statusCode == 200) {
        //print(response.body.toString());
        return  true;
      } else {
        print("Failed with status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }
}