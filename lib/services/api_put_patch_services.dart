import 'dart:convert';
import 'package:api_practice_codecraft/models/put_patch_model.dart';
import 'package:http/http.dart' as http;

class ApiPutPatchServices {
  Future<PutAndPatchModel?> putJob(Map<String, dynamic> body, String user) async {
    try {
      var response = await http.put(
        Uri.parse("https://reqres.in/api/users/$user"),
         body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        PutAndPatchModel putAndPatchModel = PutAndPatchModel.fromJson(jsonDecode(response.body));
        print(response.body.toString());
        return putAndPatchModel;
      } else {
        print("Failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }


  Future<PutAndPatchModel?> patchJob(Map<String, dynamic> body, String user) async {
    try {
      var response = await http.patch(
        Uri.parse("https://reqres.in/api/users/$user"),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        PutAndPatchModel putAndPatchModel = PutAndPatchModel.fromJson(jsonDecode(response.body));
        print(response.body.toString());
        return putAndPatchModel;
      } else {
        print("Failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }
}
